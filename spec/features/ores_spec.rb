require 'spec_helper'
require 'js_helpers'

describe "ores", :js => true do

	it "should be able to create an ore" do
		server = Server.first
		visit "/server/1"

		map = server.maps.first
		page.find(".linkmap-#{map.id}").click

		# it will wait the map show up in screen
		page.first("#map")
		page.all("#map .ore").should be_empty

		# This code creates a ore in a X, Y position
		# on the map. As I was not able to get Capybara
		# to right_click on a specific X, Y position
		# of the screen, I'm using JS to provide the same
		# feature.
		#
		# It right clicks on the X:100, Y:100 on the
		# map and select a item in the menu (Oricharium)
		JS_Helpers::execute_js_in_test_scope page, <<-javascript
			click_open_menu(100, 100);
			select_item("oricharium")
		javascript

		page.all("#map .ore").should_not be_empty
	end

	it "should ble able to remove an ore" do
		server = Server.first
		visit "/server/1"

		map = server.maps.first
		page.find(".linkmap-#{map.id}").click

		# it will wait the map show up in screen
		page.first("#map")
		page.all("#map .ore").should_not be_empty

		JS_Helpers::execute_js_in_test_scope page, <<-javascript
			// select the ore and open the menu
			$(".ore").trigger("contextmenu")

			select_item("remove")
		javascript


		page.all("#map .ore").should be_empty
	end

end