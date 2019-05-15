class ItemsController < ApplicationController
  def index
  end

  def new
    @items = Item.new
    @item = Category.all.order("id ASC").limit(13)
    # 10.times{@item.photos.build}画像S3に保存するとき
    render layout: nil
    binding.pry
  end

  def create
    @item = Item.ner(item_params)
    render action: :new
  end

  def show
  end

  private

  def item_params
    params.require(:item).permit(:name, :cotent, :category_id, :brand_id, :size, :delivery_burden, :delivery_method, :delivery_method, :delivery_area, :delivery_date, :price, :item_condition, item_image_attributes: [:image]).merge(user_id: current_user.id)
  end

end
