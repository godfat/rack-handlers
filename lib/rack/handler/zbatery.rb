
require 'zbatery'
require 'rack/handler/rainbows'

Rack::Handler::Zbatery = Class.new(Rack::Handler::Rainbows)

Rack::Handler.register('zbatery', Rack::Handler::Zbatery)
