class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top]
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_up_path_for(resouces)
    flash[:notice] = "Welcome! You have successfully signed up！"
    user_path(current_user)
  end

  def after_sign_in_path_for(resouces)
    flash[:notice] = "You have successfully signed in！"
    user_path(current_user)
  end

  def after_sign_out_path_for(resouces)
    flash[:notice] = "You have successfully signed out！"
    root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
  end
end
