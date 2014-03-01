class MapsController < ApplicationController
  layout false, :only => :show

  def show 
    @server = Rails.cache.fetch(["server", server_id]) { Server.find(params[:server_id]) }
    @map    = Rails.cache.fetch(["map", map_id, server_id]) { Map.find(map_id) } 
    @ores   = Rails.cache.fetch(["map_ores", map_id, server_id]) { @map.ore_nodes.where(server_id: @server.id).all }  

    @user_ip = request.remote_ip
  end

  def create
    @map = Map.new(name: params[:name], image: params[:image], 
                   image_mini: params[:image_mini], 
                   size_x: params[:size_x], size_y: params[:size_y])

    @map.save

    redirect_to :root
  end

  def edit
    @map = Map.find(params[:id])
  end

  def update
    @map = Server.find(params[:server_id]).maps.find(params[:id])

    respond_to do |format|
      if @map.update_attributes(params[:map])
        flash[:notice] = 'The Map was successfully updated.'
        format.html { redirect_to action: :index }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @map.errors, status: :unprocessable_entity }
      end
    end
  end

  def new_ores
    @ore_nodes = Rails.cache.fetch(["map_ores", "new_ores", server_id, map_id]) { OreNode.where("server_id = ? and map_id = ?", server_id, map_id) }  
    @user_ip   = request.remote_ip
  end

  def server_id
    params[:server_id]
  end

  def map_id
    params[:id]
  end
end
