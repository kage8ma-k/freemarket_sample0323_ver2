class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
    @parents = Category.all.order("id ASC").limit(13)
    if params[:root_id].present?
      @new_children = Category.where(ancestry: params[:root_id])
      render json: @new_children
    elsif params[:child_id].present?
      @new_grand_children = Category.where("ancestry LIKE ?", "%/#{params[:child_id]}")
      render json: @new_grand_children
    elsif params[:grand_child_id].present?
      @new_great_grand_children = Category.where("ancestry LIKE ?", "%/#{params[:grand_child_id]}")
      render json: @new_great_grand_children
    end
      # render json: @new_great_grand_children
    # 10.times{@item.photos.build}画像S3に保存するとき
    render layout: nil
  end

  def create
    @item = Item.new(item_params)
    render action: :new
  end

  def show
  end

  private

  def item_params
    params.require(:item).permit(:name, :cotent, :category_id, :brand_id, :size_id, :delivery_burden, :delivery_method, :prefecture_id, :delivery_date, :price, :item_condition, item_image_attributes: [:image]).merge(user_id: current_user.id)
  end

end
