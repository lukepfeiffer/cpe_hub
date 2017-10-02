class UsersController < ApplicationController
  before_action :valid_edit_access, only: :edit
  expose :user

  def new
  end

  def create
    user = User.new(user_params)
    user.access_level = 1
    if user.save
      UserMailer.confirmation(user).deliver_now
      flash[:success] = "Signed up! Check your email to confirm account."
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    if user.save
      flash[:success] = "User updated successfully!"
      redirect_to edit_user_path(user.id)
    else
      flash[:danger] = "Something went wrong..."
      render :edit
    end
  end

  def confirm_email
    user = User.find_by_confirm_token(params[:id])
    if user
      user.email_activate
      flash[:success] = "Email was confirmed, sign in!"
      redirect_to log_in_path
    else
      flash[:danger] = "Unable to find matching user..."
      redirect_to root_path
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
