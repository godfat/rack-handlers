
begin
  require "#{dir = File.dirname(__FILE__)}/task/gemgem"
rescue LoadError
  sh 'git submodule update --init'
  exec Gem.ruby, '-S', $PROGRAM_NAME, *ARGV
end

Gemgem.init(dir) do |s|
  s.name    = 'rack-handlers'
  s.version = '0.7.2'
  %w[rack].each{ |g| s.add_runtime_dependency(g) }
end
