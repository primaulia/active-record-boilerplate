class AddChefNameToRestaurants < ActiveRecord::Migration[5.1]
  def change
    # add_column <table_name in symbol>,
    # <column_name in symbol>, <column type in symbol>, 

    add_column :restaurants, :chef_name, :string
  end
end