class HomeController < ApplicationController
	def index
    @server         = Rails.cache.fetch(["server", params[:server]]) { Server.find(params[:server]) }
		@maps_high_end  = Rails.cache.fetch(["server", "maps", params[:server]]) { @server.maps.high_end }
    @maps_low_end   = Rails.cache.fetch(["server", "maps", params[:server]]) { @server.maps.low_end } 
	end
end
