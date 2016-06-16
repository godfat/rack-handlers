
require 'rack-handlers'

module Rack::Handler::RailsServer
  private
  def option_parser options
    parser = super
    parser.on('-C', '--CONFIG=PATH', String,
              "Server-specific config file") do |v|
      options[:server_config] = v
    end
    parser
  end
end

require 'rails/commands/server'

Rails::Server::Options.prepend(Rack::Handler::RailsServer)
