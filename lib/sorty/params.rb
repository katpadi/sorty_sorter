module Sorty
  class Params
    attr_reader :column, :direction, :defined_cols, :collection

    DEFAULT_SORT_KEY = :updated_at
    DEFAULT_SORT_DIR = :desc

    # TODO: Maybe set some default sort columns

    def initialize(col, dir, collection)
      @column = :"#{col}"
      @direction = :"#{dir}"
      @collection = collection
      @defined_cols = collection.sort_columns
    end

    def options
      Hash[sort_col, sort_dir]
    end

    def options!
      Hash[sort_col!, sort_dir!]
    end

    private

    def sort_col
      sort_col!
    rescue
      DEFAULT_SORT_KEY
    end

    def sort_dir
      sort_dir!
    rescue
      DEFAULT_SORT_DIR
    end

    def sort_col!
      fail Sorty::Errors::InvalidColumnDefined.new(column) if column.blank?
      col = defined_cols.fetch(:"#{column}").keys.first
      fail Sorty::Errors::ColumnDoesNotExist.new(col.to_s) unless collection.column_names.include?(col.to_s)
      col
    rescue KeyError
      fail Sorty::Errors::InvalidExposedAttribute.new(column)
    end

    def sort_dir!
      return direction if %i(desc asc).include?(direction)
      defined_cols.fetch(:"#{column}").values.first
    rescue KeyError
      fail Sorty::Errors::InvalidDirectionDefined 
    end
  end
end