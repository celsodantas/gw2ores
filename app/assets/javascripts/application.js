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

var context_mouse = function () {
	var context = $(".context-menu-root:visible")

	this.x_pos = function () {
		return context.offset().left;
	}

	this.y_pos = function () {
		return context.offset().top;
	}

	return this;
}

var menu_click = function(name)
{
  var x = ((window.mouseXPos - 12) / $("#map").width())  * 100
  var y = ((window.mouseYPos - 12) / $("#map").height()) * 100
	add_ore(name, x, y);
};

var add_ore = function(ore, x, y) 
{
	$.post(
            "/servers/" + gServer + "/ore_nodes/map/" + active_map_id, 
            {
            	name: ore,
            	x: x,
            	y: y
        	}, "js"
        ); 
};

var remove_node = function(id) 
{
	$.post("/ore_nodes/delete/" + id, "js"); 
}

var confirm_node = function(id)
{
	$.post("/ore_nodes/confirm/" + id, "js"); 
}

$(function() {
  $(document.body).on("mousemove", "#map", function (e) {
    var parentOffset = $(this).parent().offset(); 
  
    window.mouseXPos = e.pageX - parentOffset.left;
    window.mouseYPos = e.pageY - parentOffset.top;
  })

  // ON HIGH END MAPS
  $(".high_end_maps").on("click", function () {
    init_highend_context_menu();
  })

  $(".low_end_maps").on("click", function () {
    init_lowend_context_menu();
  })

  init_highend_context_menu = function () {
    $.contextMenu('destroy');

    register_confirm_remove()
    
    $.contextMenu( 
    {
      selector: "#map",
      items: {
        orichalcum: {
            name: "Orichalcum",  
            className: "orichalcum",
            icon: "orichalcum",
            callback: function (e) { menu_click(e); }
        },
        omnomberry: {
            name: "Omnomberry",   
            className: "omnomberry",
            icon: "omnomberry",
            callback: function (e) { menu_click(e); }
        },
        ancient_wood: {
            name: "Ancient Wood", 
            className: "ancient-wood",
            icon: "ancient-wood",
            callback: function (e) { menu_click(e); }
        },
        passion_flower: {
            name: "Passion Flower", 
            className: "passion-flower",
            icon: "passion-flower",
            callback: function (e) { menu_click(e); }
        }
      }
    });
  }

  init_lowend_context_menu = function () {
    $.contextMenu('destroy');

    register_confirm_remove()

    $.contextMenu( 
    {
      selector: "#map",
      items: {
        vanilla_bean: {
            name: "Vanilla Bean",  
            className: "vanilla-bean",
            icon: "vanilla-bean",
            callback: function (e) { menu_click(e); }
        }
      }
    });
  }

  register_confirm_remove = function () {
    $.contextMenu( 
    {
      selector: ".ore",
      items: {
        confirm: {
            name: "Confirm",
            className: "confirm",
            callback: function (item, opt) { 
              global = opt
              confirm_node(opt.$trigger.find("img").attr("data-id")) 
            },
        },
        remove: {
          name: "Remove", 
          className: "remove",
          callback: function (item, opt) { 
            global = opt
            remove_node(opt.$trigger.find("img").attr("data-id")) 
          }
        }
        
      }
    });
  }
	

  $("#display_more_maps").on("click", function() {
    $(".low_end_maps").toggle();
  });

	/////////
	// Will check every N seconds for new content
	/////////
	// setInterval(function() 
	// {
	// 	if (active_map_id == "none") return;

	// 	var last_ore_id = $("#map .ore").last().data("id");
	// 	console.log(last_ore_id)

	// 	$.get(
 //            "/servers/"+ gServer +"/maps/" + active_map_id + "/new_ores", 
 //            {
 //            	last_ore_id: last_ore_id
 //        	}
 //        ); 

	// }, 30000);

})