class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :username
    devise_parameter_sanitizer.for(:sign_up) << :area
    devise_parameter_sanitizer.for(:sign_up) << :playername
    devise_parameter_sanitizer.for(:sign_up) << :team
    devise_parameter_sanitizer.for(:sign_up) << :position
    devise_parameter_sanitizer.for(:sign_up) << :age
    devise_parameter_sanitizer.for(:account_update) << :username
    devise_parameter_sanitizer.for(:account_update) << :area
    devise_parameter_sanitizer.for(:account_update) << :playername
    devise_parameter_sanitizer.for(:account_update) << :team
    devise_parameter_sanitizer.for(:account_update) << :position
    devise_parameter_sanitizer.for(:account_update) << :age
  end
  
  def after_sign_out_path_for resource
    root_path
  end 
 
  def after_sign_in_path_for(resource) 
    user_path(resource)
  end

end