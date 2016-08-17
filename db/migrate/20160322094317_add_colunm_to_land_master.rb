class AddColunmToLandMaster < ActiveRecord::Migration
  def change
    add_column :land_masters, :f_name, :string
    add_column :land_masters, :cnic, :string
  end
end
