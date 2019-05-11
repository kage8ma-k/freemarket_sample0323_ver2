# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

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
    render layout: 'user_registration2'
  end

  def new5
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
  end

  def create5
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

end
