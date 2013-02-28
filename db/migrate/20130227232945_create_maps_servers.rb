class CreateMapsServers < ActiveRecord::Migration
  def change
    create_table :maps_servers, :id => false do |t|
      t.integer :map_id
      t.integer :server_id
    end
  end
end
