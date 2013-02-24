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

  def reset_all
    if params[:key] == ::OreLocations::Application::RESET_KEY
      OreNode.destroy_all

      Server.all.each do |s|
        s.reset_dates << ResetDate.new
      end

      render :json => {:status => "ok"}
    else
      render :nothing => true, :status => :service_unavailable
    end
  end
end
