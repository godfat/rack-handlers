
require 'unicorn'
require 'rack/handler'

class Rack::Handler::Unicorn
  def self.server_class
    ::Unicorn::HttpServer
  end

  def self.run app, opts
    server_name = name[/::(\w+)$/, 1].downcase
    config_path = "#{config_dir(opts)}/config/#{server_name}.rb"
    config_file = config_path if File.exist?(config_path)

    server = initialize_server(app, opts, config_file)

    yield(server) if block_given?

    server.start.join
  end

  def self.config_dir opts
    if opts[:config]
      File.dirname(opts[:config])
    else
      '.'
    end
  end

  def self.initialize_server app, opts, config_file
    server_class.new(app, :listeners   => "#{opts[:Host]}:#{opts[:Port]}",
                          :config_file => config_file)
  end
end

Rack::Handler.register('unicorn', Rack::Handler::Unicorn)
