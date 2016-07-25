class ApplicationController < ActionController::Base

  before_action :authenticate_user!, :only => [:show, :index]

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  helper_method :current_user?

  #選択したオブジェクトのuser_idがログインユーザーかどうかを判別する
  def current_user?(user_id)
    user_id == current_user.id
  end

  # sign_up、sign_in、account_updateの時に、usernameも許可する
  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :remember_me) }
      devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :username, :email, :password, :remember_me) }
      devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :password, :password_confirmation, :current_password) }
    end
end
