class AddMapSize < ActiveRecord::Migration
  def up
  	add_column :maps, :size_x, :integer
  	add_column :maps, :size_y, :integer
  end

  def down
  	remove_column :maps, :size_x
  	remove_column :maps, :size_x
  end
end
