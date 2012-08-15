# CHANGES

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
