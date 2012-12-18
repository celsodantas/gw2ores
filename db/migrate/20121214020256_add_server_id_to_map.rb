class AddServerIdToMap < ActiveRecord::Migration
  def change
    add_column :maps, :server_id, :integer
  end
end
