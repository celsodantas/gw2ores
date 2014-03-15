class Server < ActiveRecord::Base
  attr_accessible :name, :location

  has_and_belongs_to_many :maps
  has_many :ore_nodes

end
