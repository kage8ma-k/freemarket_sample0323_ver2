class UsersController < ApplicationController
  before_action :move_to_index, except: [:personalinfomation, :logout, :profile, :show, :update, :creditcards]

  def personalinfomation
    @user = User.find_by(id: current_user.id)

  end

  def logout

  end

  def profile

  end

  def show

  end

  def creditcards

  end

  def update
    binding.pry
    @user = User.find_by(id: current_user.id)
    @user.user_profile.update(user_params)

    redirect_to root_path
  end

  def user_params
    params.require(:user).permit(:postal_code, :block_number, :building_name).merge(user_id: current_user.id)
  end

end
