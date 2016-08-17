class CreateInvestments < ActiveRecord::Migration
  def change
    create_table :investments do |t|
      t.float :amount
      t.integer :town_id

      t.timestamps null: false
    end
  end
end
