class CreditcardsController < ApplicationController

  before_action :set_card

  # Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
  Payjp.api_key = 'sk_test_244fdd265d93b5b68f27d238'
  def index

  end

  def edit

  end

  def register
    customer = Payjp::Customer.create(
      card: params['payjp-token'],
      )
    # @creditcards = Creditcards.new(user_id: 1,customer_id: customer.id, card_id: customer.default_card)
    @creditcards = Creditcard.new(user_id: current_user.id,customer_id:  customer.id, card_id: customer.default_card)

    @creditcards.save
    redirect_to creditcards_path

    # if @creditcards.save
    #   redirect_to creditcards_path, notice: "カードが登録されました。"
    # else
    #   redirect_to creditcards_path, alert: "カードの登録に失敗しました。"
    # end

  end

  def dele
    customer = Payjp::Customer.retrieve(@creditcard.customer_id)
    customer.delete
    Creditcard.find(@creditcard.id).delete

    # redirect_to creditcards_path, notice: "カードが削除されました。"
    redirect_to creditcards_path

  end

  def set_card
    @creditcard = Creditcard.find_by(user_id: current_user.id)
  end

end
