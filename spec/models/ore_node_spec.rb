require 'spec_helper'

describe OreNode do

	it "should increase confirmation counter when save" do
		ore = OreNode.create
		ip  = "200.0.0.0"
		
		response = ore.confirm! ip

		ore_from_db = OreNode.find(ore.id)
		ore_from_db.confirmations_count.should eq 1
		response.should eq true
	end

	it "should not increase confirmation count if ip already confirmed the ore" do
		ore = OreNode.create
		ip  = "200.0.0.0"
		ore.confirm! ip
		
		response = ore.confirm! ip

		ore_from_db = OreNode.find(ore.id)
		ore_from_db.confirmations_count.should eq 1
		response.should eq false
	end

end