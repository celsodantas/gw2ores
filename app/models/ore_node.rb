class OreNode < ActiveRecord::Base
  attr_accessible :map_id, :server_id, :name, :x, :y

  belongs_to :map
  belongs_to :reset_date
  belongs_to :server, :counter_cache => true, :touch => true

  has_many :confirmations, :class_name => OreConfirmation

  def confirm!(user_ip)
    if OreConfirmation.where(user_ip: user_ip, ore_node_id: self.id).present?
      false
    else
      OreConfirmation.create(user_ip: user_ip, ore_node_id: self.id)
      self.reload
      true
    end
  end

  def confirmations_count
  	self.ore_confirmations_count
  end

  def confirmations_count=(c)
  	self.ore_confirmations_count = c
  end

  def user_confirmed?(user_ip)
  	OreConfirmation.where(ore_node_id: id, user_ip: user_ip).present?
  end
end
