class OreConfirmation < ActiveRecord::Base
  attr_accessible :user_ip, :ore_node_id

  belongs_to :ore_node, :counter_cache => true
end
