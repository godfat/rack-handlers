
require 'unicorn'
require 'rack/handler'

class Rack::Handler::Unicorn
  def self.server_class
    ::Unicorn::HttpServer
  end

  def self.run app, options
    server = server_class.new(app,
      :listeners   => "#{options[:Host]}:#{options[:Port]}",
      :config_file => options[:config_file])

    yield(server) if block_given?

    server.start.join
  end
end

Rack::Handler.register('unicorn', Rack::Handler::Unicorn)
