class ApplicationController < ActionController::Base
  before_action :configure_custom_parameters, if: :devise_controller?

  protected

  def configure_custom_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |params|
      params.permit(:username, :email, :password, :password_confirmation)
    end
  end  
end
