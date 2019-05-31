class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show, :new, :create, :search]

  def index
    @items = Item.includes(:user).limit(4).order("created_at DESC")
  end

  def new
    @item = Item.new
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
    @items = Item.includes([:user, :item_images, :category]).find(params[:id])
    @users_item = Item.where(user_id: @items.user_id).where.not(id: @items.id).order("created_at ASC").limit(6)

  end

  private

  def item_params
    params.require(:item).permit(:name, :content, :category_id, :brand_id, :size_id, :delivery_burden, :delivery_method, :prefecture_id, :delivery_date, :price, :item_condition, item_images_attributes:[:image]).merge(user_id: 1, sales_status: 0)
  end
end
