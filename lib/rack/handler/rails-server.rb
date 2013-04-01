
if ARGV[0] && ARGV[0] == 'server'[0, ARGV[0].size] && ARGV[1] !~ /^\w+/
  server = %w[zbatery rainbows unicorn puma thin].find do |s|
    begin
      require s
      true
    rescue LoadError
      false
    end
  end

  ARGV.insert(1, server)
end
