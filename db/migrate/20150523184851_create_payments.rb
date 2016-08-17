class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.float :amount
      t.datetime :date
      t.boolean :status
      t.integer :employee_id
      t.integer :land_master_id
      t.integer :expense_id
      t.integer :town_id
      t.integer :customer_id
      t.integer :payment_type_id

      t.timestamps null: false
    end
  end
end
