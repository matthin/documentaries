class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery(:with => :exception)

  before_action(:configure_permitted_parameters, :if => :devise_controller?)

protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :password) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:name, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u|
      params = [:name, :email, :password, :current_password]
      params << :role if can?(:assign_roles, current_user)
      u.permit(params)
    }
  end
end
