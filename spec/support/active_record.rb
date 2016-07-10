require 'active_record'
require 'sorty'

ActiveRecord::Base.establish_connection adapter: "mysql2", database: "test"

# module ActiveModel::Validations
#   def errors_on(attribute)
#     self.valid?
#     [self.errors[attribute]].flatten.compact
#   end
#   alias :error_on :errors_on
# end

class Drone < ActiveRecord::Base
  sort_with pointz: { points: :asc },
            name: { name: :asc },
            no_such_col: { waley: :asc },
            date: { updated_at: :desc }
end

def clean_database
  models = [Drone]
  models.each do |model|
    ActiveRecord::Base.connection.execute "TRUNCATE TABLE #{model.table_name}"
  end
end