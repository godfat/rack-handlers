
if ARGV[0] == 'server'[0, ARGV[0].size] && ARGV[1] !~ /^\w+/
  require 'bundler/setup'
  server = %w[zbatery rainbows unicorn puma thin].find do |s|
    begin
      require s

      require 'rack/server'
      class ::Rack::Server
        alias_method :old_default_options, :default_options
        define_method :default_options do
          old_default_options.merge(:config_file => "config/#{s}.rb")
        end
      end

    rescue LoadError
    end
  end

  ARGV.insert(1, server)
end
