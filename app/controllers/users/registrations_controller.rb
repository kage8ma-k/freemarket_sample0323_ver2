# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    render layout: 'user_registration1'
  end

  def new1
    @active = ['active', '', '', '', '']
    render layout: 'user_registration2'
  end

  def new2
    @active = ['active', 'active', '', '', '']
    render layout: 'user_registration2'
  end

  def new3
    @active = ['active', 'active', '', '', '']
    render layout: 'user_registration2'
  end

  def new4
    @active = ['active', 'active', 'active', '', '']
    @user = User.find(session[:user_id])
    @prefecture = Prefecture.all
    render layout: 'user_registration2'
  end

  def new5
    @active = ['active', 'active', 'active', 'active', '']
    @user = User.find(session[:user_id])
    render layout: 'user_registration2'
  end

  def new6
    @active = ['active', 'active', 'active', 'active', 'active']
    render layout: 'user_registration2'
  end

  def create1
    @user = User.new(user_params)
    @user_profile = UserProfile.new(user_profile_params)
    if [@user.valid?, @user_profile.valid?, password_confirmation_validates].all?
      ActiveRecord::Base.transaction do
        @user.save
        @user_profile.save
        ActiveRecord::Base.transaction do
          @user_profile.user_id = @user.id
          @user_profile.save
        end
      end
      session[:user_id] = @user.id
      redirect_to signup_sms_confirmation_path(@user)
    else
      @active = ['active', '', '', '', '']
      render :new1, locals: { active: @active }, layout: 'user_registration2'
    end

  end

  def create2
    @user_id = session[:user_id]
    @user_profile = UserProfile.find_by(user_id: @user_id)
    @user_profile.attributes = user_profile_phone_params
    if @user_profile.save(context: :phone_number_validates)
      redirect_to signup_sms_confirmation_sms_path
    else
      @active = ['active', 'active', '', '', '']
      render :new2, locals: { active: @active }, layout: 'user_registration2'
    end
  end

  def create3
    @user_id = session[:user_id]
    @user = User.find(@user_id)
    if @user.update(certification_number_params)
      redirect_to signup_input_address_path
    else
      @active = ['active', 'active', '', '', '']
      render :new3, locals: { active: @active }, layout: 'user_registration2'
    end
  end

  def create4
    @user_id = session[:user_id]
    @user_profile = UserProfile.find_by(user_id: @user_id)
    @user_profile.attributes = user_profile_detail_params
    if @user_profile.save(context: :address)
      redirect_to signup_input_payment_path
    else
      @active = ['active', 'active', 'active', '', '']
      render :new4, locals: { active: @active }, layout: 'user_registration2'
    end
  end

  def create5
    @user_id = session[:user_id]
    @credit = Credit.new(credit_params.merge(user_id: @user_id))
    if @credit.save
      redirect_to signup_complete_path
    else
      @active = ['active', 'active', 'active', 'active', '']
      render :new5, locals: { active: @active }, layout: 'user_registration2'
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

  def password_confirmation_validates
    params.permit(:password)["password"] == params.permit(:password_confirmation)["password_confirmation"]
  end

  def user_profile_phone_params
    params.permit(:phone_number)
  end

  def certification_number_params
    params.permit(:certification_number)
  end

  def user_profile_detail_params
    params.permit(:lastname, :firstname, :lastname_kana, :firstname_kana, :postal_code, :prefecture, :city, :block_number, :building_name)
  end

  def credit_params
    params.permit(:card_number, :expiration_month, :expiration_year, :security_code)
  end
end
