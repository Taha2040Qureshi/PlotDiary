class CreateStakeHolders < ActiveRecord::Migration
  def change
    create_table :stake_holders do |t|
      t.string :name
      t.integer :address_id
      t.integer :investment_id
      t.integer :town_id

      t.timestamps null: false
    end
  end
end
