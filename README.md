# Sorty

This gem is used for sorting collection in a Rails controller or API given a set of parameters.

## Installation

Add this line to your application's Gemfile:

    gem 'sorty'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sorty

## Usage

1. Add declaration of sorting columns to model:

    ```ruby
    sort_with update_date: { updated_at: :desc },
              name: { name: :asc }
    ```

2. Call sort service:

    ```ruby
    Sorty::Sort.apply(collection, 'name', 'asc')
    ```

## Contributing

1. Fork it ( https://github.com/katpadi/sorty/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
