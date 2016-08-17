class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.string :name
      t.integer :expense_id
      t.integer :town_id

      t.timestamps null: false
    end
  end
end
