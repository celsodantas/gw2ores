class MapController < ApplicationController
  layout false

  def index
  	@map = Map.find(params[:id])

  	render(:index)
  end
end
