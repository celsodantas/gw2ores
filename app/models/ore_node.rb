class OreNode < ActiveRecord::Base
  attr_accessible :map_id, :name, :x, :y

  belongs_to :map
  belongs_to :reset_date
end
