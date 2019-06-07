class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show, :new, :create, :search, :edit, :update]
  before_action :move_to_index, unless: :user_signed_in?, only: [:new]

  def index
    @ladies = Item.set_index(category_id: 14..211)
    @mens = Item.set_index(category_id: 226..355)
    @kids = Item.set_index(category_id: 371..489)
    @cosme = Item.set_index(category_id: 811..898)
    @chanel = Item.set_index(brand_id: 1)
    @vuitton = Item.set_index(brand_id: 2)
    @supreme = Item.set_index(brand_id: 3)
    @nike = Item.set_index(brand_id: 4)
  end

  def new
    @item = Item.new
    @item.item_images.build
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

  def edit
    @item = Item.find_by(id: params[:id])
  end

  def show
    @item = Item.find(params[:id])
    @users_item = Item.where(user_id: @item.user_id).where.not(id: @item.id).order("created_at ASC").limit(6)
    @same_brand = Item.where(brand_id: @item.brand_id).where.not(id: @item.id, user_id: @item.user_id).order("created_at ASC").limit(6)
    @prefecture = Prefecture.find(@item.prefecture_id)
    @previous = @item.next_to_item("previous")
    @next_item = @item.next_to_item("next_item")
  end

  def update
    item = Item.find(params[:id])
    if item.update(update_item_params)
      destroy_images = item.item_images.where.not(id: params[:image_ids])
      destroy_images.each do |image|
        image.destroy
      end
      params[:item_images][:image].each do |image|
        item.item_images.create(image: image, item_id: item.id)
      end
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :content, :category_id, :brand_id, :size_id, :delivery_burden, :delivery_method, :prefecture_id, :delivery_date, :price, :item_condition, item_images_attributes:[:image]).merge(user_id: current_user.id, sales_status: 0)
  end

  def update_item_params
   params.require(:item).permit(:name, :content, :category_id, :brand_id, :size_id, :delivery_burden, :delivery_method, :prefecture_id, :delivery_date, :price, :item_condition, item_images_attributes:[:image, :_destroy, :id]).merge(user_id: current_user.id, sales_status: 0)
  end

  def move_to_index
    redirect_to new_user_session_path
  end
end
