class UsersController < ApplicationController
  expose :user

  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      UserMailer.confirmation(user).deliver_now
      flash[:success] = "Signed up! Check your email to confirm account."
      redirect_to root_path
    else
      render :new
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
