class BuyController < ApplicationController

  def index
    render layout: false
  end

  def purchase
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(currency: 'jpy', amount: 1000, card: params['payjp-token'])

    render layout: false
    # redirect_to root_path, notice: "支払いが完了しました"
  end

end
