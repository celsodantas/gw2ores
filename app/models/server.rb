class Server < ActiveRecord::Base
  attr_accessible :name, :location

  has_many :ore_nodes
  has_and_belongs_to_many :maps
end
