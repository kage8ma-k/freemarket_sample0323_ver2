class BuyController < ApplicationController

  def index
    render layout: false
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

end
