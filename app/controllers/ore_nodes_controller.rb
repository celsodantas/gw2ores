class OreNodesController < ApplicationController
  def create
  	@map     = Map.find params[:map_id]
    @server  = Server.find params[:server_id]
    @user_ip = request.remote_ip

  	@ore = OreNode.create(name:      params[:name], 
                          x:         params[:x], 
                          y:         params[:y], 
                          map_id:    @map.id,
                          server_id: @server.id)

    @user_confirmed = true
    @ore.confirmations_count = 1

    OreConfirmation.create(user_ip: @user_ip, ore_node_id: @ore.id)
  end

  def delete
  	@ore = OreNode.find(params[:id])
    @confirmations = OreConfirmation.where(ore_node_id: @ore.id)

    # This code is due to Rails not updating the counter cache for Many associations
    Server.update_counters @ore.server_id, :ore_nodes_count => -1

    @confirmations.delete_all

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

  def confirm
    @ore     = OreNode.find params[:id]
    @user_ip = request.remote_ip

    if @ore.confirm! @user_ip
      render :confirm
    else
      render :confirm_deny 
    end

    @ore = OreNode.find params[:id]
  end
end
