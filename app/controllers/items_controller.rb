class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
    # 10.times{@item.photos.build}画像S3に保存するとき
    @item.item_images.build
    render layout: nil
  end

  def search
    if params[:l_cat]
      @m_cat = Category.find(params[:l_cat]).children
    else
      @s_cat = Category.find(params[:m_cat]).children
    end
    respond_to do |format|
      format.html
      format.json
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save
        params[:item_images][:image].each do |image|
          @item.item_images.create(image: image, item_id: @item.id)
        end
      redirect_to root_path
    else
      @item.item_images.build
      render :new
    end
  end

  def show
  end

  private

  def item_params
    params.require(:item).permit(:name, :content, :category_id, :brand_id, :size_id, :delivery_burden, :delivery_method, :prefecture_id, :delivery_date, :price, :item_condition, item_images_attributes:[:image]).merge(user_id: 1, sales_status: 0)
  end
end
