class HashtagsController < ApplicationController
  LINK_LENGTH  = 22

  def show
    @hashtag_tweets = connect_api.hashtag(params[:id])
  end

  def share
    @page = MetaInspector.new(params[:url])
    render layout: false
  end

end