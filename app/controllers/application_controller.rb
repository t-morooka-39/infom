class ApplicationController < ActionController::Base
  
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name])
      devise_parameter_sanitizer.permit(:account_update, keys: [:last_name])
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name])
      devise_parameter_sanitizer.permit(:account_update, keys: [:first_name])
      devise_parameter_sanitizer.permit(:sign_up, keys: [:sex])
      devise_parameter_sanitizer.permit(:account_update, keys: [:sex])
      devise_parameter_sanitizer.permit(:sign_up, keys: [:admin])
    end
end
