class CreateGivenInstallments < ActiveRecord::Migration
  def change
    create_table :given_installments do |t|
      t.integer :installment_id
      t.integer :town_id
      t.datetime :submit_date
      t.integer :land_master_id
      t.boolean :status

      t.timestamps null: false
    end
  end
end
