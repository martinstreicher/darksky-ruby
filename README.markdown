[![Code Climate](https://codeclimate.com/github/martinstreicher/darksky-ruby/badges/gpa.svg)](https://codeclimate.com/github/martinstreicher/darksky-ruby) [![Test Coverage](https://codeclimate.com/github/martinstreicher/darksky-ruby/badges/coverage.svg)](https://codeclimate.com/github/martinstreicher/darksky-ruby/coverage) [![Build Status](https://semaphoreci.com/api/v1/projects/c7accaa7-f062-452c-ada6-621c1c59435b/552121/badge.svg)](https://semaphoreci.com/locomotivellc/darksky-ruby)


darksky
=======

*darksky* is a Ruby gem to retrieve short-term precipitation data from the [Dark
Sky API v2](<https://developer.forecast.io/docs/v2>) for geographic points
inside the United States.


Installation
------------

Install it from your shell:

`$ gem install darksky`
 

Or install it via *bundler*. Open your *Gemfile* and add the line:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
gem 'darksky'
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 

And then run:

`$ bundle install`
 

Usage
-----

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
darksky = Darksky::API.new('this-is-your-dark-sky-api-key')

# Returns a forecast for the next hour at a given location.
forecast = darksky.forecast('42.7243','-73.6927')

# Returns a forecast for the next hour at a given location.
forecast = darksky.forecast('42.7243','-73.6927', Time.now.to_i)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The result, `forecast`, will either be a hash containing data or `nil` if an
error occurred. The hash resembles the following sample:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
{
   "latitude" => 42.7243,
  "longitude" => -73.6927,
   "timezone" => "America/New_York",
     "offset" => -4,
  "currently" => {
                   "time" => 1443198595,
                "summary" => "Mostly Cloudy",
                   "icon" => "partly-cloudy-day",
        "precipIntensity" => 0,
      "precipProbability" => 0,
            "temperature" => 66.71,
    "apparentTemperature" => 66.71,
               "dewPoint" => 48.95,
               "humidity" => 0.53,
              "windSpeed" => 1.13,
            "windBearing" => 148,
             "visibility" => 10,
             "cloudCover" => 0.62,
               "pressure" => 1029.02,
                  "ozone" => 266.53
  },
  "minutely" => { [...]
  },
  "hourly" => { [...]
  },
  "daily" => { [...]
  },
  "flags" => { [...]
  }
}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The exact contents of the hash are explained in detail in the [API
docs](<https://developer.forecast.io/docs/v2>).


Contributing to darksky
-----------------------

-   Check out the latest master to make sure the feature hasn't been implemented
    or the bug hasn't been fixed yet

-   Check out the issue tracker to make sure someone already hasn't requested it
    and/or contributed it

-   Fork the project

-   Start a feature/bugfix branch

-   Commit and push until you are happy with your contribution

-   Make sure to add tests for it. This is important so I don't break it in a
    future version unintentionally.

-   Please try not to mess with the Rakefile, version, or history. If you want
    to have your own version, or is otherwise necessary, that is fine, but
    please isolate to its own commit so I can cherry-pick around it.


Copyright
---------

Copyright (c) 2012-2015 David Czarnecki, Martin Streicher. See LICENSE.txt for
further details.
