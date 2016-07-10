module Sorty
  class Sort
    def self.apply(collection, column = nil, direction = nil)
      collection.order(Params.new(column, direction, collection).options)
    end

    def self.apply!(collection, column = nil, direction = nil)
      collection.order(Params.new(column, direction, collection).options!)
    end
  end
end