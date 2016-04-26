
source 'https://rubygems.org'

gemspec

gem 'rake'
gem 'pork'

gem 'simplecov', :require => false if ENV['COV']
gem 'coveralls', :require => false if ENV['CI']

platform :ruby do
  gem 'yahns'
  gem 'zbatery'
  gem 'rainbows'
  gem 'unicorn'
  gem 'puma'
  gem 'thin'
end

platform :jruby do
  gem 'torquebox'
  gem 'trinidad'
end

platforms :rbx do
  gem 'rubysl-singleton' # used in rake
  gem 'rubysl-readline'  # we need readline extension
end
