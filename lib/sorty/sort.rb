module Sorty
  class Sort

    def self.apply(collection, column = nil, direction = nil)
      # TODO: Handle if sort_with is not defined
      collection.order(Params.new(column, direction, collection.sort_columns).options)
    end
  end
end