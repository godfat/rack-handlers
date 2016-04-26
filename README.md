# rack-handlers [![Build Status](https://secure.travis-ci.org/godfat/rack-handlers.png?branch=master)](http://travis-ci.org/godfat/rack-handlers) [![Coverage Status](https://coveralls.io/repos/godfat/rack-handlers/badge.png)](https://coveralls.io/r/godfat/rack-handlers)

by Lin Jen-Shin ([godfat](http://godfat.org))

## LINKS:

* [github](https://github.com/godfat/rack-handlers)
* [rubygems](https://rubygems.org/gems/rack-handlers)
* [rdoc](http://rdoc.info/github/godfat/rack-handlers)

## DESCRIPTION:

Unicorn family Rack handlers for you. Mostly for `rails s`.

## REQUIREMENTS:

* Rack
* The web server you want to use (e.g. unicorn, yahns, rainbows, zbatery, etc)

## INSTALLATION:

    gem install rack-handlers

## SYNOPSIS:

Put `'rack-handlers'` and your favorite unicorns into Gemfile
then you could do the followings:

    rails s unicorn
    rails s yahns
    rails s rainbows
    rails s zbatery

Because requiring `'rack-handlers'` would make `Rack::Handler.default`
pick the server with the following order:

* yahns
* zbatery
* rainbows
* unicorn
* torquebox (for jruby)
* trinidad (for jruby)
* puma
* thin
* webrick

Thus if you have rainbows installed, `rails s` would launch the server with
rainbows instead of webrick (the original behaviour).

Additionally, it would also try to load the config via `config/yahns.rb`,
or `config/unicorn.rb` depending on which server is picked.

For people who likes to run `rails s`!

## CONTRIBUTORS:

* Lin Jen-Shin (@godfat)

## LICENSE:

Apache License 2.0

Copyright (c) 2012-2016, Lin Jen-Shin (godfat)

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

<http://www.apache.org/licenses/LICENSE-2.0>

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
