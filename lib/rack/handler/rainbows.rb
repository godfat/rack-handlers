
require 'rainbows'
require 'rack/handler/unicorn'

class Rack::Handler::Rainbows < Rack::Handler::Unicorn
  def self.server_class
    ::Rainbows::HttpServer
  end
end

Rack::Handler.register('rainbows', Rack::Handler::Rainbows)
