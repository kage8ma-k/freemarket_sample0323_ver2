class CreditcardsController < ApplicationController

  def index
    # @creditcards = Creditcard.all
  end

  def edit

  end

  def register
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    customer = Payjp::Customer.create(
      card: params['payjp-token'],
      )
    # @creditcards = Creditcards.new(user_id: 1,customer_id: customer.id, card_id: customer.default_card)
    @creditcards = Creditcard.new(user_id: '1',customer_id:  customer.id, card_id: customer.default_card)


    @creditcards.save
    redirect_to action: "index"
  end

end
