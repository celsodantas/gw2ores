class ConvertOrePositionsToFloat < ActiveRecord::Migration
  def up
    change_column :ore_nodes, :x, :float
    change_column :ore_nodes, :y, :float
  end

  def down
    change_column :ore_nodes, :x, :integer
    change_column :ore_nodes, :y, :integer
  end
end
