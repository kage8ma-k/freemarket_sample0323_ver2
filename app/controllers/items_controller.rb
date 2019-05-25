class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
    @items = Item.includes(:user).limit(4).order("created_at DESC")
  end

  def new
    render layout: nil
  end

  def show
    @items = Item.includes([:user, :item_images, :category]).find(params[:id])
    @users_item = Item.where(user_id: @items.user_id).order("created_at ASC").limit(6)

  end

end
