class CreateExpenseTypes < ActiveRecord::Migration
  def change
    create_table :expense_types do |t|
      t.string :name
      t.integer :town_id

      t.timestamps null: false
    end
  end
end
