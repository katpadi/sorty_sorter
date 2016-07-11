# Sorty Sorter

[![Gem Version](https://badge.fury.io/rb/sorty_sorter.svg)](https://badge.fury.io/rb/sorty_sorter)
[![Code Climate](https://codeclimate.com/github/katpadi/sorty_sorter/badges/gpa.svg)](https://codeclimate.com/github/katpadi/sorty_sorter)
[![Test Coverage](https://codeclimate.com/github/katpadi/sorty_sorter/badges/coverage.svg)](https://codeclimate.com/github/katpadi/sorty_sorter/coverage)

This gem sorts AR collection when given a set of parameters that will be validated against the whitelisted attributes in the model.

## Installation

Add this line to your application's Gemfile:

    gem 'sorty_sorter'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sorty_sorter

## Usage

1. Define whitelist attributes to model:

    ```ruby
    sort_with update_date: { updated_at: :desc },
              name: { name: :asc }
    ```

   In the example above, `update_date` is the exposed attribute and it represents the `updated_at` column in DB.
   The whitelist hash represents the "valid" attributes that may be sorted.

2. Call `sorty_sort` method:

    ```ruby
    @collection.sorty_sort('name', 'asc')
    ```

There is also a bang method `sorty_sort!` that will raise an exception if you're doing anything wrong.

## Example

As mentioned, a definition of the whitelist hash should be done in the model.

```ruby
# app/models/drone.rb

class Drone < ActiveRecord::Base
  # Define!
  sort_with update_date: { updated_at: :desc },
  points: { points: :asc },
  title: { name: :asc }
end
```

The outer Hash keys (i.e. `update_date`) represent the "exposed" attributes whereas their corresponding values (`updated_at: :desc`) represent the DB column name as the key, and its default sort direction in case there is no argument passed as the value.

Say you want to sort the collection based on `name`, the parameter `title` should be passed because that is the "exposed" attribute. 

Since the gem already mixed in a method `sorty_sort` to the ActiveRecord::Relation, you can do the following conveniently:

```ruby
Drone.all.sorty_sort('title', 'asc')
```

## Contributing

1. Fork it ( https://github.com/katpadi/sorty_sorter/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
