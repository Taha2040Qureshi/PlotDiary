class AddColumnToPayment < ActiveRecord::Migration
  def change
    add_column :payments, :stake_holder_id, :integer
  end
end
