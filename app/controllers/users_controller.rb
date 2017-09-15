class UsersController < ApplicationController
  expose :user

  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      flash[:success] = "Signed up! Check your email to confirm account."
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :username,
      :email,
      :password,
      :password_confirmation
    )
  end
end
