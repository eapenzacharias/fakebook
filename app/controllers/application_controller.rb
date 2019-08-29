class ApplicationController < ActionController::Base
  before_action :permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  private
  def permitted_parameters
    devise_parameter_sanitizer.permit(:signup, keys: [:name, :birthday])
  end
end
