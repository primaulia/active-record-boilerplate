class CreateRestaurants < ActiveRecord::Migration[5.1]
  def change
    # create_table <table_name in symbol> do |t|
    #   t.<column_type> <column_name in symbol>
    # end


    create_table :restaurants do |t|
      t.string    :name
      t.string    :address
      t.timestamps 
      # the columns t.timestamps created two columns below
      # t.date :created_at
      # t.date :updated_at
    end
  end
end