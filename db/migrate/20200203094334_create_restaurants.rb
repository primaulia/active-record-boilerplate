# !!! the classname ==> UpperCamelCase
# !!! the filename ==> lower_snake_case
class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t| # t ==> represents the table column field
      t.string    :name
      t.string    :address
      t.timestamps # add 2 columns, `created_at` and `updated_at`
    end
  end
end