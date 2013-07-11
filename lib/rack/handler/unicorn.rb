
require 'unicorn'
require 'rack/handler'

class Rack::Handler::Unicorn
  def self.server_class
    ::Unicorn::HttpServer
  end

  def self.run app, opts
    config_path = "#{File.dirname(opts[:config])}/config/#{opts[:server]}.rb"
    config_file = config_path if File.exist?(config_path)

    server = server_class.new(app,
      :listeners   => "#{opts[:Host]}:#{opts[:Port]}",
      :config_file => config_file)

    yield(server) if block_given?

    server.start.join
  end
end

Rack::Handler.register('unicorn', Rack::Handler::Unicorn)
