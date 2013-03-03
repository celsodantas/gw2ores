class AddColumnOreConfirmationsCountToOreNode < ActiveRecord::Migration
  def change
    add_column :ore_nodes, :ore_confirmations_count, :integer, null:false, default: 0
  end
end
