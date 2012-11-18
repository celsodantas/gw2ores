class MapController < ApplicationController
  layout false

  def index
  	@map = Map.find(params[:id])

  	render(:index)
  end

  def create
    {name: "Malchors Leap", }
    @map = Map.new(name: params[:name], image: params[:image], 
                   image_mini: params[:image_mini], 
                   size_x: params[:size_x], size_y: params[:size_y])

    @map.save

    redirect_to :root
  end

  def new_ores
  	@map = Map.find(params[:id])

  	@new_ores = @map.ore_nodes.select do |n| 
  		n.id > params[:last_ore_id].to_i
  	end
  end
end
