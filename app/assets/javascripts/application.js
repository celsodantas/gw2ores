// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require jquery.ui.position
//= require jquery.contextMenu.min
//= require jquery.colorbox-min
//= require_tree .


var active_map_id = "none";

var menu_click = function(name)
{
	var x = window.mouseXPos - $("#map").offset().left - 12;
	var y = window.mouseYPos - $("#map").offset().top  - 12;
	add_ore(name, x, y);
};

var add_ore = function(ore, x, y) 
{
	$.post(
            "ore_node/map/" + active_map_id, 
            {
            	name: ore,
            	x: x,
            	y: y
        	}, "js"
        ); 
};

var remove_node = function(id) 
{
	$.post("ore_node/delete/" + id, "js"); 
}

$(function() {
   	$(document).mousedown(function(e){
   		if (e.which == 3)
   		{
   			window.mouseXPos = e.pageX;
      		window.mouseYPos = e.pageY;
   		}
   	});

	$.contextMenu( 
	{
		selector: "#map",
		items: {
		  orichalcum: {
		  		name: "Oricharium", callback: function (e) { menu_click(e); }
		  },
		  omnomberry: {
		  		name: "Omnomberry", callback: function (e) { menu_click(e); }
		  },
		  ancient_wood: {
		  		name: "Ancient Wood", callback: function (e) { menu_click(e); }
		  }
		}
	});

	$.contextMenu( 
	{
		selector: ".ore",
		items: {
		  remove: {
		  		name: "Remove", callback: function (item, opt) { remove_node(opt.$trigger.attr("data-id")) }
		  }
		}
	});

	/////////
	// Will check every N seconds for new content
	/////////
	setInterval(function() 
	{
		if (active_map_id == "none") return;

		var last_ore_id = $("#map .ore").last().data("id");
		console.log(last_ore_id)

		$.get(
            "map/" + active_map_id + "/new_ores", 
            {
            	last_ore_id: last_ore_id
        	}
        ); 

	}, 30000);
})