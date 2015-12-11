
# Assume you want a more sensible default, or don't require this file

require 'rack/handler'

module Rack::Handler
  DEFAULT = %w[yahns zbatery rainbows unicorn puma thin webrick]

  def self.default(options = {})
    # Guess.
    if ENV.include?("PHP_FCGI_CHILDREN")
      # We already speak FastCGI
      options.delete :File
      options.delete :Port

      Rack::Handler::FastCGI
    elsif ENV.include?("REQUEST_METHOD")
      Rack::Handler::CGI
    else
      pick DEFAULT # We only change this line
    end
  end

  # Copied from rack 1.5.2 for backward compatibility
  def self.pick(server_names)
    server_names = Array(server_names)
    server_names.each do |server_name|
      begin
        return get(server_name.to_s)
      rescue LoadError, NameError
      end
    end

    raise LoadError, "Couldn't find handler for: #{server_names.join(', ')}."
  end unless respond_to?(:pick)
end
