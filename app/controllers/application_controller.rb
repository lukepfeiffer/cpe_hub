class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :authenticate_superuser
  helper_method :authenticate_admin
  helper_method :authenticate_user

  authem_for :user

  def authenticate_user
    valid_access_level(1)
  end

  def authenticate_admin
    valid_access_level(4)
  end

  def authenticate_superuser
    valid_access_level(5)
  end

  private

  def valid_access_level(min_level)
    if current_user.nil? || current_user.access_level < min_level
      flash[:danger] = "You do not have access for that action."
      redirect_to root_path
    end
  end

end
