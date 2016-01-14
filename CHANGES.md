# CHANGES

## rack-handlers 0.7.2 -- 2016-01-14

* Added torquebox and trinidad to the default list for JRuby.
  Note that they distribute their own rack handler, therefore
  this only changes the default list rather than providing one.

## rack-handlers 0.7.1 -- 2015-12-12

* Added a new rack handler for yahns.

## rack-handlers 0.7.0 -- 2013-08-22

* Introduced rack-handlers.rb for you that patched `Rack::Handler.default`
  with the following order: zbatery, rainbows, unicorn, puma, thin, webrick.
  You would no longer need to require 'rack/handler/rails-server' in order to
  make `rails s` work for unicorns.

## rack-handlers 0.6.1 -- 2013-07-11

* Ditto.

## rack-handlers 0.6.0 -- 2013-07-11

* Properly find the default config path.

## rack-handlers 0.5.6 -- 2013-04-01

* [rails server] Don't hack Rack. Instead, always try to look up
  default config path. If there's nothing, then don't load the config.

## rack-handlers 0.5.5 -- 2012-08-23

* Fix an error from running simply `rails`.
  ARGV[0] doesn't exist in that case.

## rack-handlers 0.5.4 -- 2012-08-15

* Fix my incautiousness.

## rack-handlers 0.5.3 -- 2012-08-15

* Add `rack/handlers/rails-server` which would make `rails s` find the
  proper rack server via trying to load zbatery, rainbows, unicorn, puma,
  and thin. If none of them are found, falling back to default. (webrick)

## rack-handlers 0.5.2 -- 2012-02-22

### Enhancement

* Now Unicorn, Rainbows, Zbatery accepts :config_file

### Bugs fixes

* Now it is depending on rack

## rack-handlers 0.5.1 -- 2012-02-20

### Bugs fixes

* Fixed Zbatery handler name

## rack-handlers 0.5.1 -- 2012-02-20

* Birthday!
* Unicorn supported
* Rainbows supported
* Zbatery supported
