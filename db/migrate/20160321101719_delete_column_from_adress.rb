class DeleteColumnFromAdress < ActiveRecord::Migration
  def change
    remove_column :addresses, :city
    remove_column :addresses, :country
    remove_column :addresses, :zip_code
  end
end
