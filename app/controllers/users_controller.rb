class UsersController < ApplicationController

  def show
    @user_bio    = connect_api.user_bio(params[:id])
    @user_tweets = connect_api.timeline(params[:id])
  end

end