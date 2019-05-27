class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  add_flash_types :success, :info, :warning, :danger

  # before_action :authenticate_user!

  private
  def after_sign_out_path_for(resource)
    items_path
  end

end

