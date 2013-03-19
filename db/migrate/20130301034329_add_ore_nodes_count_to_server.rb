class AddOreNodesCountToServer < ActiveRecord::Migration
  def change
    add_column :servers, :ore_nodes_count, :integer, null:false, default: 0
  end
end
