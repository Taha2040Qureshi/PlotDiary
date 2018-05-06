class CreateMaps < ActiveRecord::Migration
  def change
    create_table :maps do |t|
      t.float :latitude
      t.float :longitude
      t.string :address
      t.string :title

      t.timestamps null: false
    end
  end
end
