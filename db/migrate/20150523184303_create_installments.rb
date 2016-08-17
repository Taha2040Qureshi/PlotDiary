class CreateInstallments < ActiveRecord::Migration
  def change
    create_table :installments do |t|
      t.string :name
      t.integer :installment_type_id
      t.boolean :status
      t.integer :town_id

      t.timestamps null: false
    end
  end
end
