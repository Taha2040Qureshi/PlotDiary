class AddDateToExpense < ActiveRecord::Migration
  def change
    add_column :expenses, :expense_date , :date
  end
end
