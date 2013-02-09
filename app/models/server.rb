class Server < ActiveRecord::Base
  attr_accessible :name, :location

  has_many :ore_nodes
  has_many :maps
  has_many :reset_dates
end
