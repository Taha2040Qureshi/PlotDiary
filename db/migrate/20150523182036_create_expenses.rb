class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.float :amount
      t.boolean :status
      t.integer :town_id
      t.integer :expense_type_id

      t.timestamps null: false
    end
  end
end
