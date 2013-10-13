class AddHighEndToMaps < ActiveRecord::Migration
  def change
    add_column :maps, :high_end, :boolean, :default => false

    Map.reset_column_information

    Map.all.each do |map|
      map.high_end = true
      map.save 
    end
  end
end
