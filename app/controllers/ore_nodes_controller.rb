class OreNodesController < ApplicationController
  def create
  	@map = Map.find(params[:map_id])
    @server = Server.find(params[:server_id])

  	@ore = OreNode.new(name:      params[:name], 
                       x:         params[:x], 
                       y:         params[:y], 
                       map_id:    @map.id,
                       server_id: @server.id)
  	@ore.save
  end

  def delete
  	@ore = OreNode.find(params[:id])
  	@ore.delete
  end

  def reset_all
    if params[:key] == ::OreLocations::Application::RESET_KEY
      OreNode.destroy_all
      ResetDate.create!

      render :json => {:status => "ok"}
    else
      render :nothing => true, :status => :service_unavailable
    end
  end
end
