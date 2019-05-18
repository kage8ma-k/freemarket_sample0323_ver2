# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  include Common

  # GET /resource/sign_up
  def new
    render layout: 'user_registration1'
  end

  def new1
    render layout: 'user_registration2'
  end

  def new2
    render layout: 'user_registration2'
  end

  def new3
    render layout: 'user_registration2'
  end

  def new4
    @user = User.find(session[:user_id])
    @prefecture = prefecture_set
    render layout: 'user_registration2'
  end

  def new5
    @user = User.find(session[:user_id])
    render layout: 'user_registration2'
  end

  def new6
    render layout: 'user_registration2'
  end

  def create1
    if @user = User.create(user_params)
      @user_profile = UserProfile.new(user_profile_params)
      @user_profile.user_id = @user.id
      if @user_profile.save
        session[:user_id] = @user.id
        redirect_to signup_sms_confirmation_path(@user)
      end
    else
      render :new1, layout: 'user_registration2'
    end
  end

  def create2
    @user_id = session[:user_id]
    @user_profile = UserProfile.find_by(user_id: @user_id)
    if @user_profile.update(user_profile_phone_params)
      redirect_to signup_sms_confirmation_sms_path
    else
      render :new2, layout: 'user_registration2'
    end
  end

  def create3
    @user_id = session[:user_id]
    @user = User.find(@user_id)
    if @user.update(certification_number_params)
      redirect_to signup_input_address_path
    else
      render :new3, layout: 'user_registration2'
    end
  end

  def create4
    @user_id = session[:user_id]
    @user_profile = UserProfile.find_by(user_id: @user_id)
    if @user_profile.update(user_profile_detail_params)
      redirect_to signup_input_payment_path
    else
      render :new4, layout: 'user_registration2'
    end
  end

  def create5
    @user_id = session[:user_id]
    @credit = Credit.new(credit_params.merge(user_id: @user_id))
    if @credit.save
      redirect_to signup_complete_path
    else
      render :new5, layout: 'user_registration2'
    end
  end

  def create6
  end

  private

  def user_params
    params.permit(:nickname, :email, :password)
  end

  def user_profile_params
    params.permit(:lastname, :firstname, :lastname_kana, :firstname_kana, :birth_year, :birth_month, :birth_day)
  end

  def user_profile_phone_params
    params.permit(:phone_number)
  end

  def certification_number_params
    params.permit(:certification_number)
  end

  def user_profile_detail_params
    params.permit(:lastname, :firstname, :lastname_kana, :firstname_kana, :postal_code, :prefecture, :city, :block_number, :building_name, :phone_number)
  end

  def credit_params
    params.permit(:card_number, :expiration_month, :expiration_year, :security_code)
  end
end
