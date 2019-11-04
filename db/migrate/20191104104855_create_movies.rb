class CreateMovies < ActiveRecord::Migration[5.1]
  def change
    create_table :movies do |t|
      t.string     :title
      t.integer    :year
      t.string     :summary
      t.string     :director
      # t.array


      t.timestamps # add 2 columns, `created_at` and `updated_at`
    end
  end
end