require 'spec_helper'

describe "access first server page", :type => :feature do
	
	it "should see ore count on first map" do
		server = Server.first
		visit "/server/#{server.id}"

		ores = server.maps.first.ore_nodes

		page.first(".map").find(".ore_count").text.to_i.should eq ores.count
	end

end