class BuyController < ApplicationController

  before_action :set_card, :set_item

  def index
    render layout: false
  end

  def show

  end

  def pay
    price = 1500
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
    # @pre = Prefecture.where(id: current_user.user_profile.prefecture_id)
    # @pre = Prefecture.first.id
  end


end
