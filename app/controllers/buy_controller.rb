class BuyController < ApplicationController

  before_action :set_card, only: [:pay]
  before_action :set_item, only: [:show,:pay]

  def show
    @item = Item.find(params[:id])
  end

  def pay
    price = @item.price
    customer_id = Creditcard.find_by(user_id: current_user.id).customer_id
    @current_card = Payjp::Customer.retrieve(customer_id)

    Payjp.api_key = 'sk_test_244fdd265d93b5b68f27d238'
    Payjp::Charge.create(
    amount: price,
    customer: customer_id,
    currency: 'jpy',
    )
    render layout: false

  end

  def set_card
    @creditcard = Creditcard.find_by(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
    @prefecture = Prefecture.find_by(id: current_user.user_profile.prefecture_id).name
  end


end
