class CreatePaymentTypes < ActiveRecord::Migration
  def change
    create_table :payment_types do |t|
      t.string :payment_type
      t.integer :town_id

      t.timestamps null: false
    end
  end
end
