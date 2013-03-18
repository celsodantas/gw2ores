require 'spec_helper'

describe "access server 1 map", :type => :feature do

	it "should see the map when click over the link" do
		server = Server.first
		visit "/server/1"

		map = server.maps.first

		page.find(".linkmap-#{map.id}").click
		page.should have_selector("#map")
	end

end