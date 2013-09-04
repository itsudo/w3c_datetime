# [W3cDatetime](https://github.com/itsudo/w3c_datetime)

[![Build Status](https://travis-ci.org/itsudo/w3c_datetime.png)](https://travis-ci.org/itsudo/w3c_datetime)

Parses and outputs date and time according to [W3C date and time formats](http://www.w3.org/TR/NOTE-datetime)

## Installation

Add this line to your application's Gemfile:

    gem 'w3c_datetime'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install w3c_datetime

## Usage

Parse string and get back Time or nil:

    W3cDatetime::parse('2013-04-10T10:10')

    W3cDatetime::parse('2013-03-11')

    W3cDatetime::parse('1997-07-16T19:20:30.45+01:00')

To get string representation of time just call to_w3c_datetime on Time object:

    Time.new.to_w3c_datetime

Please see tests for detailed usage.

## TODO

## Authors

 * [Michal Pawlowski](http://cv.misza.co.uk)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
