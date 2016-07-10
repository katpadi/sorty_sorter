module Extensions
  # ActiveRecord extensions
  module ActiveRecord
    # Extensions for ActiveRecord::Relation
    module Relation
      extend ActiveSupport::Concern

      # Introduce a new AR Relation method :-)
      def sorty_sort(column = nil, direction = nil)
        ::Sorty::Sort.apply(self, column, direction)
      end

      def sorty_sort!(column = nil, direction = nil)
        ::Sorty::Sort.apply!(self, column, direction)
      end
    end
  end
end

ActiveSupport.on_load(:active_record) do
  ActiveRecord::Relation.send(:include, Extensions::ActiveRecord::Relation)
end