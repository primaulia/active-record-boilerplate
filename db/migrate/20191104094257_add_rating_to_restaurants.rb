class AddRatingToRestaurants < ActiveRecord::Migration[5.1]
  def change
    # add_column <table_name in symbol>,
    # <column_name in symbol>, <column type in symbol>, 

    add_column :restaurants, :rating, :integer, default: 0, null: false
  end
end