require 'spec_helper'
require 'js_helpers'

describe "ores" do

	it "should be able to create an ore", :js => true do
		## GIVEN
		server = Server.first
		map    = server.maps.first

		visit "/server/1"

		page.find(".linkmap-#{map.id}").click

		page.should have_css "#map"
		page.should_not have_css "#map .ore"
		
		## WHEN
		JS_Helpers::execute_js_in_test_scope page, <<-javascript
			click_open_menu(100, 100);
			select_item("orichalcum")
		javascript

		## THEN
		page.all("#map .ore").should_not be_empty
	end

	it "should ble able to remove an ore", :js => true, :focus => true do
		## GIVEN
		server = Server.first
		map    = server.maps.first
		# FIXME:: overwrite the << method to add server and map id to Ore
		ore = OreNode.create name: "orichalcum", x: 100, y: 100, server_id: server.id, map_id: map.id
		
		visit "/server/1"
		page.find(".linkmap-#{map.id}").click

		page.should have_css "#map"
		page.should have_css "#map .ore"

		## WHEN
		JS_Helpers::execute_js_in_test_scope page, <<-javascript
			// select the ore and open the menu
			$(".ore").trigger("contextmenu")

			select_item("remove")
		javascript

		## THEN
		page.should_not have_css "#map .ore"
	end

end
