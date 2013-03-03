class MapsController < ApplicationController
  layout false, :only => :show

  def show 
    @server  = Server.find(params[:server_id])
  	@map     = Map.find(params[:id])
    @ores    = @map.ore_nodes.where(server_id: @server.id)
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
    server_id = params[:server_id]
    map_id    = params[:map_id]

    @ore_nodes = OreNode.where("server_id = ? and map_id = ?", server_id, map_id)
    @user_ip   = request.remote_ip
  	# @map = Server.find(params[:server_id]).maps.find(params[:map_id])

  	# @new_ores = @map.ore_nodes.select do |n| 
  	# 	n.id > params[:last_ore_id].to_i
  	# end
  end
end
