class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

  protected


  def after_sign_in_path_for(resource)
    if user_signed_in?
      new_vehicle_path
    end
  end


  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end


  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :avatar, :first_name, :last_name, :email])
  end
end
