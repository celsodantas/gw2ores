class Map < ActiveRecord::Base
  attr_accessible :name, :image, :image_mini
  #has_many :ore_nodes

  def ore_nodes
  	reset = ResetDate.last
  	reset.ore_nodes.where("map_id = #{self.id}")
  end
end
