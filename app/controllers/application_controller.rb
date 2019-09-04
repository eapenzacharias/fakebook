# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # Main application controller for our fakebook app
  before_action :permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  private

  def permitted_parameters
    devise_parameter_sanitizer.permit(:signup, keys: [:name, :l_name, :birthday])
  end
end
