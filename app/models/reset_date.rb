class ResetDate < ActiveRecord::Base
	has_many :ore_nodes
	belongs_to :server
end
