class MapController < ApplicationController
  def index
  	@map = Map.find(params[:id])

  	render(:index)
  end
end
