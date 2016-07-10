# Sorty Sorter

[![Gem Version](https://badge.fury.io/rb/sorty_sorter.svg)](https://badge.fury.io/rb/sorty_sorter)
[![Code Climate](https://codeclimate.com/github/katpadi/sorty_sorter/badges/gpa.svg)](https://codeclimate.com/github/katpadi/sorty_sorter)
[![Test Coverage](https://codeclimate.com/github/katpadi/sorty_sorter/badges/coverage.svg)](https://codeclimate.com/github/katpadi/sorty_sorter/coverage)

This simple gem sorts collection in a Rails controller/API controller given a set of parameters based on the declared columns in the model. An ActiveRecord::Relation method `sorty_sort` is added for convenience.

When defining valid columns that are "sortable", you can choose to mask the attributes so the DB columns will not be announced to the world. In other words, you can choose to name your exposed attribute differently than your DB column name. See Usage #1 as reference.


## Installation

Add this line to your application's Gemfile:

    gem 'sorty_sorter'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sorty_sorter

## Usage

1. Add declaration of sorting columns to model:

    ```ruby
    sort_with update_date: { updated_at: :desc },
              name: { name: :asc }
    ```

   In the example above, `update_date` is the exposed attribute and it represents the `updated_at` column in DB.
   The declaration will serve as the "valid" attributes that may be used for sorting.

2. Call sort method:

    ```ruby
    @collection.sorty_sort('name', 'asc')
    ```

There is also a bang method `sorty_sort!` that will raise an exception if you're doing anything wrong.

## Example

An example when used in API:

```sh
curl -i -H "Accept: application/json" -H "Content-Type: application/json" -X GET http://katpadi/drones?sort=update_date&dir=desc
```

Say you want to sort the collection based on the column and direction passed in your API, you can use the gem's ActiveRecord::Relation method `sorty_sort` to sort the collection:

```ruby
Drone.available.sorty_sort(params[:sort], params[:dir])
```

## Contributing

1. Fork it ( https://github.com/katpadi/sorty_sorter/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
