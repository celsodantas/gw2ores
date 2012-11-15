class Map < ActiveRecord::Base
  attr_accessible :name, :image, :image_mini
  has_many :ore_nodes
end
