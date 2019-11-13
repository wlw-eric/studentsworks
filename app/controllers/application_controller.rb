class ApplicationController < ActionController::Base
  before_action :authenticate_user!, :configure_permitted_parameters

  layout :layout_by_resource

  private

  def layout_by_resource
    if devise_controller?
      "devise"
    else
      "application"
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :entreprise_name, :password])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :entreprise_name, :password])
  end
end
