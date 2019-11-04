class RemoveAddressFromRestaurants < ActiveRecord::Migration[5.1]
  def change
    # add_column <table_name in symbol>,
    # <column_name in symbol>, <column type in symbol>, 

    remove_column :restaurants, :address
  end
end