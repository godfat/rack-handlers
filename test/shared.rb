
require 'socket'

require 'rack'
require 'rack-handlers'

require 'pork'
require 'pork/more/bottomup_backtrace'
require 'pork/more/color'

Pork::API.copy :shared do
  def get name
    Rack::Handler.get(name)
  rescue LoadError
  end

  Rack::Handler::DEFAULT.each do |name|
    would "launch #{name}" do
      rd, wr = IO.pipe
      child = run(name, &wr.method(:puts))
      msg = rd.gets
      rd.close
      skip if msg == "\n"
      sleep(0.1) if name == 'puma' # slow puma
      sock = TCPSocket.new('localhost', 8080)
      sock.binmode
      sock.print("GET / HTTP/1.1\r\nHost: localhost\r\n\r\n")
      sock.readline("\r\n\r\n")
      expect(sock.read(3)).eq "OK\n"
      sock.close
      Process.kill('TERM', child)
      TCPSocket.new('localhost', 8080).close if name == 'yahns' # wake up!
      Process.waitpid(child)
    end
  end
end
