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
    @server = Server.find(params[:server])
    @server.maps.each do |map|
      map.ore_nodes.destroy_all
    end
    
    new_reset_date = ResetDate.new
    @server.reset_dates << new_reset_date

    flash[:notice] = "Maps for server #{@server.name} reseted! Now get to work to populate the maps!"
    redirect_to server_path(:server => @server.id)
  end

  def reset_all
    if params[:key] == ::OreLocations::Application::RESET_KEY
      OreNode.destroy_all

      render :json => {:status => "ok"}
    else
      render :nothing => true, :status => :service_unavailable
    end
  end
end
