class AddInstallmentKey < ActiveRecord::Migration
  def change
    add_column :installment_types, :install_type, :string
  end
end
