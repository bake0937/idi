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
      # sign_inのときに、username、emailも許可する
        devise_parameter_sanitizer.permit(:sign_in, keys:[:username,:email])
      # sign_upのときに、username、emailも許可する
        devise_parameter_sanitizer.permit(:sign_up, keys:[:username,:email])
      #account_updateのときに、username、emailも許可する
        devise_parameter_sanitizer.permit(:account_update, keys:[:username,:email])
    end
end
