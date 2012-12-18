class OreNodesController < ApplicationController
  def create
  	@map = Map.find(params[:id])
  	@ore = OreNode.new(name: params[:name], 
                       x: params[:x], 
                       y: params[:y], 
                       map_id: @map.id)
  	@ore.save
  end

  def delete
  	@ore = OreNode.find(params[:id])
  	@ore.delete
  end

  def reset

    if session[:user_id]
      OreNode.destroy_all
      ResetDate.new.save

      flash[:notice] = "Maps reseted! Now get to work to populate the maps!"
      redirect_to :root
    else
      redirect_to :login
    end
    
  end
end
