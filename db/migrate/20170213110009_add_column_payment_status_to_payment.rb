class AddColumnPaymentStatusToPayment < ActiveRecord::Migration
  def change
    add_column :payments, :payment_status, :string
  end
end
