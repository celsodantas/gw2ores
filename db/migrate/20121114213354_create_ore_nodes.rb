class CreateOreNodes < ActiveRecord::Migration
  def change
    create_table :ore_nodes do |t|
      t.string  :name
      t.integer :map_id
      t.integer :reset_date_id
      t.integer :x
      t.integer :y

      t.timestamps
    end
  end
end
