
require 'yahns'
require 'rack/handler/unicorn'

class Rack::Handler::Yahns < Rack::Handler::Unicorn
  def self.initialize_server app, opts, config_file
    config = ::Yahns::Config.new(config_file)
    config.app(:rack, app) do
      listen("#{opts[:Host]}:#{opts[:Port]}")
    end
    ::Yahns::Server.new(config)
  end
end

Rack::Handler.register('yahns', Rack::Handler::Yahns)
