class AddServerIdToResetDate < ActiveRecord::Migration
  def change
    add_column :reset_dates, :server_id, :integer

    #
    # Creating a ResetDate for each existing server
    #
    Server.all.each do |server|
    	server.reset_dates << ResetDate.new
    end
  end
end
