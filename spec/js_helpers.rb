# Some javascript definitions for testing porpouse 
require 'spec_helper'

module JS_Helpers
	module Helpers
		OPEN_MENU = <<-js

			var x = function (posx) { return $("#map").offset().left + posx; }
			var y = function (posy) { return $("#map").offset().top  + posy; }

			var click_open_menu = function (xPos, yPos) {
				$("#map").trigger({type: "contextmenu.contextMenu1", pageX: x(xPos),  pageY: y(yPos) });
			}

		js

		MENU_SELECT = <<-js

			var select_item = function (item_class) {
				$(".context-menu-item." + item_class).trigger("mouseup");
			}

		js
	end

	def self.execute_js_in_test_scope (page, js)
		page.driver.execute_script <<-SCRIPT

			(function () {

				#{Helpers::OPEN_MENU}
				#{Helpers::MENU_SELECT}

				#{js}

			})();

		SCRIPT
	end
end