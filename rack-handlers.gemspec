# -*- encoding: utf-8 -*-
# stub: rack-handlers 0.7.2 ruby lib

Gem::Specification.new do |s|
  s.name = "rack-handlers".freeze
  s.version = "0.7.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Lin Jen-Shin (godfat)".freeze]
  s.date = "2016-04-27"
  s.description = "Unicorn family Rack handlers for you. Mostly for `rails s`.".freeze
  s.email = ["godfat (XD) godfat.org".freeze]
  s.files = [
  ".gitignore".freeze,
  ".gitmodules".freeze,
  ".travis.yml".freeze,
  "CHANGES.md".freeze,
  "Gemfile".freeze,
  "README.md".freeze,
  "Rakefile".freeze,
  "config.ru".freeze,
  "config/environment.rb".freeze,
  "lib/rack-handlers.rb".freeze,
  "lib/rack/handler/rails-server.rb".freeze,
  "lib/rack/handler/rainbows.rb".freeze,
  "lib/rack/handler/unicorn.rb".freeze,
  "lib/rack/handler/yahns.rb".freeze,
  "lib/rack/handler/zbatery.rb".freeze,
  "rack-handlers.gemspec".freeze,
  "script/config.ru".freeze,
  "script/rails".freeze,
  "task/README.md".freeze,
  "task/gemgem.rb".freeze,
  "test/shared.rb".freeze,
  "test/test_basic.rb".freeze,
  "test/test_rails.rb".freeze]
  s.homepage = "https://github.com/godfat/rack-handlers".freeze
  s.licenses = ["Apache License 2.0".freeze]
  s.rubygems_version = "2.6.3".freeze
  s.summary = "Unicorn family Rack handlers for you. Mostly for `rails s`.".freeze
  s.test_files = [
  "test/test_basic.rb".freeze,
  "test/test_rails.rb".freeze]

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rack>.freeze, [">= 0"])
    else
      s.add_dependency(%q<rack>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<rack>.freeze, [">= 0"])
  end
end
