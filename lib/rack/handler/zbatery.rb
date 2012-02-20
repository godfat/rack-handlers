
require 'zbatery'
require 'rack/handler/rainbows'

Rack::Handler.register('zbatery', Rack::Handler::Rainbows)
