class OreNode < ActiveRecord::Base
  attr_accessible :map_id, :name, :x, :y

  has_one :map
  has_one :reset_date
end
