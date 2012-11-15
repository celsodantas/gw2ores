class HomeController < ApplicationController
	def index
		@server = "Fort Aspenwood"
		@maps = Map.all
	end
end
