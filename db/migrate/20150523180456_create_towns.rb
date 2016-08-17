class CreateTowns < ActiveRecord::Migration
  def change
    create_table :towns do |t|
      t.string :name
      t.integer :address_id

      t.timestamps null: false
    end
  end
end
