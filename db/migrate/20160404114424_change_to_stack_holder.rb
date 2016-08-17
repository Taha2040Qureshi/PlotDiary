class ChangeToStackHolder < ActiveRecord::Migration
  def change
    add_column :stake_holders, :f_name, :string
    add_column :stake_holders, :cnic, :string
    remove_column :stake_holders, :investment_id
    add_column :investments, :stake_holder_id, :integer
  end
end
