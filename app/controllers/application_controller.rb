class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  before_action :search_item
  protect_from_forgery with: :exception

  add_flash_types :success, :info, :warning, :danger

  # before_action :authenticate_user!
  def search_item
    @search = Item.ransack(params[:q])
    @result = @search.result
  end
private

  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
  end
end
end
