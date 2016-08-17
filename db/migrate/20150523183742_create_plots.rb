class CreatePlots < ActiveRecord::Migration
  def change
    create_table :plots do |t|
      t.integer :plot_number
      t.float :total_price
      t.float :area
      t.float :length
      t.float :width
      t.integer :town_id

      t.timestamps null: false
    end
  end
end
