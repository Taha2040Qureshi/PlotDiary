class AddCloumnToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :f_name, :string
    add_column :employees, :f_name, :string
    add_column :employees, :cnic, :string
    add_column :expenses, :description, :text
    add_column :stocks, :description, :text
  end
end
