# frozen_string_literal: true

class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken

  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from ActiveRecord::RecordNotFound, with: :show_not_found_errors

  protected

  def configure_permitted_parameters
    parameters = %i[name last_name email gender date_of_birth height weight objective]
    parameters += %i[role] if action_name == 'update'
    devise_parameter_sanitizer.permit(:sign_up, keys: parameters)
    devise_parameter_sanitizer.permit(:account_update, keys: parameters)
  end

  def show_not_found_errors(exception)
    render(json: { error: "#{exception.message} with 'id'=#{params[:id]}" }, status: :not_found)
  end
end
