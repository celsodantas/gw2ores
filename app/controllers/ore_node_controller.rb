class OreNodeController < ApplicationController
  def create
  	@map = Map.find(params[:id])
  	@ore = OreNode.new(name: params[:name], x: params[:x], y: params[:y], map_id: @map.id)
  	@ore.save
  end

  def delete
  	@ore = OreNode.find(params[:id])
  	@ore.delete
  end

  def reset
    OreNode.destroy_all
  	redirect_to :root
  end
end
