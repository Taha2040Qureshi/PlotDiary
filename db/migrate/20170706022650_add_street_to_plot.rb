class AddStreetToPlot < ActiveRecord::Migration
  def change
    add_column :plots, :street, :string
  end
end
