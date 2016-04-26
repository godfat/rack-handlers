
require_relative 'shared'

Pork::API.describe Rack::Handler do
  def app
    lambda do |_|
      [200, {}, ["OK\n"]]
    end
  end

  def run name, &block
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

  paste :shared
end

Pork.execute
Pork.stat.report
