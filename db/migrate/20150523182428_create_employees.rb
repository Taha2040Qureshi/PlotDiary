class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name
      t.integer :address_id
      t.integer :town_id
      t.float :salary
      t.string :designation

      t.timestamps null: false
    end
  end
end
