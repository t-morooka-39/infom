class ApplicationController < ActionController::Base
  
  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name])
      devise_parameter_sanitizer.permit(:account_update, keys: [:last_name])
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name])
      devise_parameter_sanitizer.permit(:account_update, keys: [:first_name])
      devise_parameter_sanitizer.permit(:sign_up, keys: [:sex])
      devise_parameter_sanitizer.permit(:account_update, keys: [:sex])
    end
end
