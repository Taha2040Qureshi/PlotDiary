class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.text :address_1
      t.string :address_2
      t.string :city
      t.string :country
      t.string :phone_number1
      t.string :secondary_phone_number
      t.string :zip_code

      t.timestamps null: false
    end
  end
end
