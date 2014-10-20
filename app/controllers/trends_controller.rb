class TrendsController < ApplicationController
  WORLDWIDE_ID = '1'
  REGIONAL_ID  = '468739'

  def index
  end

  def show
    @trends = connect_api.trends(params[:id])
  end

end