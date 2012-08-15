# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "rack-handlers"
  s.version = "0.5.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Lin Jen-Shin (godfat)"]
  s.date = "2012-08-15"
  s.description = "Some Rack handlers which are not included in Rack distribution."
  s.email = ["godfat (XD) godfat.org"]
  s.files = [
  ".gitignore",
  ".gitmodules",
  "CHANGES.md",
  "README.md",
  "Rakefile",
  "lib/rack/handler/rails-server.rb",
  "lib/rack/handler/rainbows.rb",
  "lib/rack/handler/unicorn.rb",
  "lib/rack/handler/zbatery.rb",
  "rack-handlers.gemspec",
  "task/.git",
  "task/.gitignore",
  "task/gemgem.rb"]
  s.homepage = "https://github.com/godfat/rack-handlers"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.24"
  s.summary = "Some Rack handlers which are not included in Rack distribution."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rack>, [">= 0"])
    else
      s.add_dependency(%q<rack>, [">= 0"])
    end
  else
    s.add_dependency(%q<rack>, [">= 0"])
  end
end
