class UsersController < ApplicationController

  def personalinfomation
    @user = User.find_by(id: current_user.id)
  end

  def logout

  end

  def profile

  end

  def show

  end

end
