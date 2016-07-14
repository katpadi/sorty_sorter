module SortySorter
  module Declaration
    extend ActiveSupport::Concern

    module ClassMethods
      attr_reader :sort_columns
      def sort_with(columns)
        @sort_columns = columns
      end

      def sorty?
        true
      end
    end
  end
end

ActiveRecord::Base.send(:include, SortySorter::Declaration)
