class ChangeInstallmentSchemeFromDb < ActiveRecord::Migration
  def change

    add_column :installments, :total_amount, :float
    add_column :installments, :advance_amount, :float
    add_column :installments, :total_number_of_installments, :integer
    add_column :installments, :per_installments_amount, :float
    add_column :installments, :installment_type, :integer

    drop_table :installment_types

    remove_column :installments, :name
    remove_column :installments, :installment_type_id

  end
end
