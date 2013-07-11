# rack-handlers

by Lin Jen-Shin ([godfat](http://godfat.org))

## LINKS:

* [github](https://github.com/godfat/rack-handlers)
* [rubygems](https://rubygems.org/gems/rack-handlers)
* [rdoc](http://rdoc.info/github/godfat/rack-handlers)

## DESCRIPTION:

Some Rack handlers which are not included in Rack distribution.

## REQUIREMENTS:

* Rack
* The web server you want to use (e.g. unicorn, rainbows, zbatery, etc).

## INSTALLATION:

    gem install rack-handlers

## SYNOPSIS:

    rails s unicorn
    rails s rainbows
    rails s zbatery

Additionally, putting `require 'rack/handler/rails-server'` in `script/rails`
*before* `require 'rails/commands'` would make `rails s` select the server
by default with this order: zbatery, rainbows, unicorn, puma, and thin.

For zbatery, rainbows, and unicorn, it would also try to load the config
via `config/zbatery.rb`, or `config/rainbows.rb` depending on which server
is selected.

For people who likes to invoke `rails s`!

## CONTRIBUTORS:

* Lin Jen-Shin (@godfat)

## LICENSE:

Apache License 2.0

Copyright (c) 2012-2013, Lin Jen-Shin (godfat)

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

<http://www.apache.org/licenses/LICENSE-2.0>

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
