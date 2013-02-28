class Map < ActiveRecord::Base
  attr_accessible :name, :image, :image_mini, :size_x, :size_y
  
  has_many :ore_nodes
  has_and_belongs_to_many :servers
end
