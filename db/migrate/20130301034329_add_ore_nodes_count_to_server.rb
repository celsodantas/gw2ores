class AddOreNodesCountToServer < ActiveRecord::Migration
  def change
    add_column :servers, :ore_nodes_count, :integer, null:false, default: 0

	    Server.all.each do |server|
	    	Server.update_counters server.id, :ore_nodes_count => server.ore_nodes.count
	    end
  end
end
