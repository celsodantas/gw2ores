class Server < ActiveRecord::Base
  attr_accessible :name, :location

  has_and_belongs_to_many :maps

  has_many :ore_nodes do
	def <<(ore)
		# As Rails don't update counter when adding 
		# elements directly. This code is necessary
		server = proxy_association.owner

		ore.server_id = server.id
		Server.update_counters server.id, :ore_nodes_count => 1
		
		super.insert ore
	end  	
  end

end
