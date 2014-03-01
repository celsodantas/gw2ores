class ServersController < ApplicationController
  def index
    results = Rails.cache.fetch("servers") do
      servers = Server.select(:location).group(:location).order("location DESC")

      {
        servers: servers,
        by_location: servers.map {|e| Server.find_all_by_location(e.location) } 
      }
    end

    @servers = results[:servers]
    @by_location = results[:by_location]
  end
end
