class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    if resource_class == Student
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name, :last_name, :email, :photo_url, :interests, :year_in_college, :living_situation, :hometown, :password, :password_confirmation)}
      devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:first_name, :last_name, :email, :photo_url, :interests, :year_in_college, :living_situation, :hometown, :password, :password_confirmation, :current_password)}
    end

    if resource_class == Tourist
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name, :last_name, :email, :prospective_major, :intended_start_date_semester, :intended_start_date_year, :password, :password_confirmation)}
      devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:first_name, :last_name, :email, :prospective_major, :intended_start_date_semester, :intended_start_date_year, :password, :password_confirmation, :current_password)}
    end
  end
end
