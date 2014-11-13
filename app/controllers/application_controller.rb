class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  protect_from_forgery with: :exception
  before_action :authenticate_user!

  rescue_from ActiveRecord::StaleObjectError do |exception|
    redirect_to items_path, :alert => t('.concurrence_error')
  end

end