# Sorty

This gem is used for sorting collection in a Rails controller/API controller given a set of parameters based on the declared columns in the model.

## Installation

Add this line to your application's Gemfile:

    gem 'sorty', :git => 'git://github.com/katpadi/sorty.git'

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

   In the example above, `update_date` is the exposed attribute and it represents the `updated_at` column in DB.

2. Call sort service:

    ```ruby
    Sorty::Sort.apply(collection, 'name', 'asc')
    ```

## Example

An example when used in API:

```sh
curl -i -H "Accept: application/json" -H "Content-Type: application/json" -X GET http://katpadi/drones?sort=update_date&dir=desc
```

In your API controller, you can do something like the syntax below to render a sorted collection:

```ruby
Sorty::Sort.apply(Drone.all, params[:sort], params[:dir])
```

## Contributing

1. Fork it ( https://github.com/katpadi/sorty/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
