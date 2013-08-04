class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  # before_filter :update_sanitized_params, if: :devise_controller?

  # def update_sanitized_params
  #   devise_parameter_sanitizer.for(:update) {|u| u.permit(:name, 
  #     :email, :phone, :street_address1, :street_address2, 
  #     :city, :state, :zip_code, :password, :password_confirmation, 
  #     :current_password) }
  # end
  	
end
