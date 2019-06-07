# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    render layout: 'user_registration1'
  end

  def reg_first_view
    @user = User.new
    @active = ['active', '', '', '', '']
    render layout: 'user_registration2'
  end

  def reg_second_view
    @active = ['active', 'active', '', '', '']
    render layout: 'user_registration2'
  end

  def reg_third_view
    @active = ['active', 'active', '', '', '']
    render layout: 'user_registration2'
  end

  def reg_forth_view
    @active = ['active', 'active', 'active', '', '']
    @user = User.find(session[:user_id])
    @prefectures = Prefecture.all
    render layout: 'user_registration2'
  end

  def reg_fifth_view
    @active = ['active', 'active', 'active', 'active', '']
    @user = User.find(session[:user_id])
    render layout: 'user_registration2'
  end

  def reg_final_view
    @active = ['active', 'active', 'active', 'active', 'active']
    render layout: 'user_registration2'
  end

  def reg_first_post
    if params[:user_id]
      user = User.find(params[:user_id])
      @user_profile = user.create_user_profile(user_profile_params)
      session[:user_id] = @user_profile.user_id
      redirect_to signup_sms_confirmation_path(user)
    else
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
        render :reg_first_view, locals: {active: @active}, layout: 'user_registration2'
      end
    end

  end

  def reg_second_post
    @user_id = session[:user_id]
    @user_profile = UserProfile.find_by(user_id: @user_id)
    @user_profile.attributes = user_profile_phone_params
    if @user_profile.save(context: :phone_number_validates)
      redirect_to signup_sms_confirmation_sms_path
    else
      @active = ['active', 'active', '', '', '']
      render :reg_second_view, locals: {active: @active}, layout: 'user_registration2'
    end
  end

  def reg_third_post
    @user_id = session[:user_id]
    @user = User.find(@user_id)
    if @user.update(certification_number_params)
      redirect_to signup_input_address_path
    else
      @active = ['active', 'active', '', '', '']
      render :reg_third_view, locals: {active: @active}, layout: 'user_registration2'
    end
  end

  def reg_forth_post
    @user_id = session[:user_id]
    @user_profile = UserProfile.find_by(user_id: @user_id)
    @user_profile.attributes = user_profile_detail_params
    if @user_profile.save(context: :address)
      resource_name = :user
      resource = User.find(@user_id)
      sign_in(resource_name, resource)
      redirect_to signup_complete_path
    else
      @active = ['active', 'active', 'active', '', '']
      @user = User.find(@user_id)
      @prefectures = Prefecture.all
      render :reg_forth_view, locals: {active: @active, user: @user, prefectures: @prefectures}, layout: 'user_registration2'
    end
  end

  def reg_fifth_post
    @user_id = session[:user_id]
    @credit = Credit.new(credit_params.merge(user_id: @user_id))
    if @credit.save
      redirect_to signup_complete_path
    else
      @active = ['active', 'active', 'active', 'active', '']
      render :reg_fifth_view, locals: {active: @active}, layout: 'user_registration2'
    end
  end

  def reg_final_post
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
    params.permit(:lastname, :firstname, :lastname_kana, :firstname_kana, :postal_code, :prefecture_id, :city, :block_number, :building_name)
  end

  def credit_params
    params.permit(:card_number, :expiration_month, :expiration_year, :security_code)
  end
end
