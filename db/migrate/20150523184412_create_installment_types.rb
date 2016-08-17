class CreateInstallmentTypes < ActiveRecord::Migration
  def change
    create_table :installment_types do |t|
      t.float :amount
      t.integer :total_number_of_installments
      t.integer :town_id

      t.timestamps null: false
    end
  end
end
