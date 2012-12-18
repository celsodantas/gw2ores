class HomeController < ApplicationController
	def index
		@server = Server.find(params[:server])
		@maps = @server.maps
	end
end
