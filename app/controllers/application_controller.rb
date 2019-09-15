# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?


  # if Rails.env.production? || ENV["RESCUE_EXCEPTIONS"]
  #   rescue_from StandardError, with: :rescue_internal_server_error
  #   rescue_from ActiveRecord::RecordNotFound, with: :rescue_not_found
  #   rescue_from ActionController::ParameterMissing, with: :resucue_bad_request
  # end
  rescue_from StandardError, with: :rescue_internal_server_error
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_not_found
  rescue_from ActionController::ParameterMissing, with: :resucue_bad_request
  # rescue_from Forbidden, with: :rescue_forbidden

  class Forbidden < ActionController::ActionControllerError
  end

  def after_sign_in_path_for(_resource)
    follow_tweet_tweets_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:last_name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:sex])
    devise_parameter_sanitizer.permit(:account_update, keys: [:sex])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:admin])
    devise_parameter_sanitizer.permit(:account_update, keys: [:new_profile_picture])
    devise_parameter_sanitizer.permit(:account_update, keys: [:remove_profile_picture])
    devise_parameter_sanitizer.permit(:account_update, keys: [:introduction])
  end

  private

  def resucue_bad_request(exception)
    render "errors/bad_request", status: 400, formats: [:html]
  end

  def rescue_forbidden(exception)
    render "errors/forbidden", status: 403, formats: [:html]
  end

  def rescue_not_found(exception)
    render "errors/not_found", status: 404, formats: [:html]
  end

  def rescue_internal_server_error(exception)
    render "errors/internal_server_error", status: 500, formats: [:html]
  end

end
