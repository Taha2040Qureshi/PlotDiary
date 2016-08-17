class RenameColumnNamePayment < ActiveRecord::Migration
  def change
    remove_column :payments,:payment_type_id
    add_column :payments, :payment_type, :string
    drop_table :payment_types
  end
end
