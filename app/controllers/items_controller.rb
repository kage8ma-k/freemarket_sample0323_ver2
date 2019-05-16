class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  def index

    @items = Item.all.includes(:user).limit(4).order("created_at DESC")
  end

  def new
    render layout: nil
  end

  def show
  end

end
