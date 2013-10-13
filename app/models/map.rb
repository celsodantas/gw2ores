class Map < ActiveRecord::Base
  attr_accessible :name, :image, :image_mini, :size_x, :size_y

  scope :high_end, where("high_end = true")
  scope :low_end, where(high_end: false)
  
  has_many :ore_nodes
  has_and_belongs_to_many :servers
end
