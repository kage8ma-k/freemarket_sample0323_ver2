class CategoriesController < ApplicationController
  def index
    @categories = Category.all

    respond_to do |format|
      format.html
      format.json { render json: @categories }
    end
  end

  def show
    @category = Category.find(params[:id])
    ancestry_id = @category.ancestry

    if ancestry_id == nil
      @categories = Category.where('ancestry LIKE(?)', "#{params[:id]}/%")
      @categories = @categories.map { |category| category.id.to_s }
      @items = Item.where(category_id: [@categories])
    elsif ancestry_id =~ /^[0-9]+$/
      @categories = Category.where('ancestry LIKE(?)', "%/#{params[:id]}")
      @categories = @categories.map { |category| category.id.to_s }
      @items = Item.where(category_id: [@categories])
    else
      @items = Item.where(category_id: params[:id])
    end
  end

  def select_top
    respond_to do |format|
      format.json{ @m_cate = Category.where('ancestry = ?', "#{params[:id]}")} if params[:id].present?
    end
  end

  def select_mid
    respond_to do |format|
      format.json{ @s_cate = Category.where('ancestry LIKE(?)', "%/#{params[:id]}")} if params[:id].present?
    end
  end

end
