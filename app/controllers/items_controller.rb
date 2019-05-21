class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
    # 10.times{@item.photos.build}画像S3に保存するとき
    render layout: nil
  end

  def search
    if params[:l_cat]
      @m_cat = Category.find(params[:l_cat]).children
    else
      @s_cat = Category.find(params[:m_cat]).children
# このあと親を取ってきたら子（m）とだす。違ったら孫をだす（s）。違ったらブランドとサイズカテゴリーをだす。

    end
    respond_to do |format|
      format.html
      format.json
    end
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
