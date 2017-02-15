class AddColumnStatusToPlot < ActiveRecord::Migration
  def change
    add_column :plots, :status, :integer, default: 0
  end
end
