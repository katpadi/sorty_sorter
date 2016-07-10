module Sorty
  module Errors
    class SortyError < StandardError; end

    class InvalidDirectionDefined < SortyError
    end

    class InvalidColumnDefined < SortyError
      def initialize(col)
        super "Invalid value for column #{col}"
      end
    end

    class InvalidExposedAttribute < SortyError
      def initialize(col)
        super "No attribute #{col} defined in model"
      end
    end

    class ColumnDoesNotExist < SortyError
      def initialize(col)
        super "Column #{col} does not exist in the database."
      end
    end
  end
end