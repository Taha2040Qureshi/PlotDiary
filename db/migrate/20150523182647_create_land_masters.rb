class CreateLandMasters < ActiveRecord::Migration
  def change
    create_table :land_masters do |t|
      t.string :name
      t.integer :address_id
      t.integer :town_id
      t.integer :installment_id

      t.timestamps null: false
    end
  end
end
