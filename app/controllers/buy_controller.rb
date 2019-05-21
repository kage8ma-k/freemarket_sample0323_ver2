class BuyController < ApplicationController

  def index
    render layout: false
  end

  def pay
    price = 1500
    customer_id = Creditcard.find_by(user_id: 1).customer_id
    @current_card = Payjp::Customer.retrieve(customer_id)

    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
    amount: price,
    customer: customer_id,
    currency: 'jpy',
    )
    render layout: false

  end

end
