
require_relative 'shared'

Pork::API.describe Rack::Handler do
  def app
    lambda do |_|
      [200, {}, ["OK\n"]]
    end
  end

  def run name, port, &block
    fork do
      if server = get(name)
        trap 'TERM' do
          server.shutdown
        end if name == 'webrick' # the way to stop webrick

        server.run(app, :Port => port){ block.call(name) }
      else
        block.call
      end
      exit!
    end
  end

  paste :shared
end unless RUBY_ENGINE == 'jruby'
