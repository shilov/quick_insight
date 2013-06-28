# Quick Insight

An experiment in gem development.

The current implemention of the gem provides a simple approach for creating JSON endpoints from within your ActiveRecord models.

## Installation

Add this line to your application's Gemfile:

    gem 'quick_insight'

And then execute:

    $ bundle

## Usage

Declare `quick_insight` in your model by adding the following:

    class User < ActiveRecord::Base
      quick_insight
    end

Define your JSON API endpoints by providing a key to be used as the name for the endpoint, followed by a block that will be executed when the endpoint is hit.

    class User < ActiveRecord::Base
      quick_insight
      insight :total, -> { User.count }
    end

Using the example above, you can now access the JSON endpoint by going to:

    http://example.com/qi/users/total     # {"users":8995}

## Roadmap

* Dynamically generate frequently used methods useful for growth analytics
* Override default routes
* URL helpers
* Caching
* Tests
* Examples of use cases

Long-term vision is to simplify the process of creating custom analytics dashboards.

## Intellectual Property

Copyright (c) 2013 [Stanley Shilov](http://www.stanleyshilov.com). Released under the MIT license.
