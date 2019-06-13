class CategoriesController < ApplicationController
  def index
    @search = Item.ransack(params[:q])
    @categories = Category.all

    respond_to do |format|
      format.html
      format.json { render json: @categories }
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
