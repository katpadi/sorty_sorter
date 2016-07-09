module Sorty
  class Params
    attr_reader :column, :direction, :declared

    DEFAULT_SORT_KEY = :updated_at
    DEFAULT_SORT_DIR = :desc

    # TODO: Maybe set some default sort columns

    def initialize(col, dir, declared)
      @column = :"#{col}"
      @direction = :"#{dir}"
      @declared = declared
    end

    def options
      Hash[sort_col, sort_dir]
    end

    private

    # TODO: Check if existing table column is given
    def sort_col
      return DEFAULT_SORT_KEY if column.blank?
      declared.fetch(:"#{column}", {}).keys.first || DEFAULT_SORT_KEY
    end

    def sort_dir
      return direction if %i(desc asc).include?(direction)
      declared.fetch(:"#{column}", {}).values.first || DEFAULT_SORT_DIR
    end
  end
end