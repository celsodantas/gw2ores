class MapController < ApplicationController
  layout false

  def index
  	@map = Map.find(params[:id])

  	render(:index)
  end

  def new_ores
  	@map = Map.find(params[:id])

  	@new_ores = @map.ore_nodes.select do |n| 
  		n.id > params[:last_ore_id].to_i
  	end
  end
end
