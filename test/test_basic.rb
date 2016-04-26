
require 'socket'

require 'rack'
require 'rack-handlers'

require 'pork'
require 'pork/more/bottomup_backtrace'
require 'pork/more/color'

Pork::API.describe Rack::Handler do
  def get name
    Rack::Handler.get(name)
  rescue LoadError => e
  end

  def run app, name, &block
    fork do
      if server = get(name)
        trap 'TERM' do
          server.shutdown
        end if name == 'webrick' # the way to stop webrick

        server.run(app, :Port => 8080){ block.call(name) }
      else
        block.call
      end
    end
  end

  app = lambda do |_|
    [200, {}, ["OK\n"]]
  end

  Rack::Handler::DEFAULT.each do |name|
    would "launch #{name}" do
      rd, wr = IO.pipe
      child = run(app, name, &wr.method(:puts))
      msg = rd.gets
      rd.close
      skip if msg == "\n"
      sleep(0.1) if name == 'puma' # puma doesn't listen immediately
      sock = TCPSocket.new('localhost', 8080)
      sock.binmode
      sock.print("GET / HTTP/1.1\r\nHost: localhost\r\n\r\n")
      puts sock.readline("\r\n\r\n")
      expect(sock.read(3)).eq "OK\n"
      sock.close
      Process.kill('TERM', child)
      TCPSocket.new('localhost', 8080).close if name == 'yahns' # wake up!
      Process.waitpid(child)
    end
  end
end

Pork.execute
Pork.stat.report
