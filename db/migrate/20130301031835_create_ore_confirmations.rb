class CreateOreConfirmations < ActiveRecord::Migration
  def change
    create_table :ore_confirmations do |t|
      t.integer :ore_node_id
      t.string :user_ip

      t.timestamps
    end
  end
end
