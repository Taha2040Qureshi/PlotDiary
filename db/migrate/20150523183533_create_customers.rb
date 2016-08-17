class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :cnic
      t.integer :address_id
      t.integer :plot_id
      t.integer :installment_id
      t.string :status
      t.integer :town_id

      t.timestamps null: false
    end
  end
end
