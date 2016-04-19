class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?
  after_filter :store_action

   def store_action
     return unless request.get?
     if (request.path != "/students/sign_in" &&
         request.path != "/students/sign_up" &&
         request.path != "/students/password/new" &&
         request.path != "/students/password/edit" &&
         request.path != "/students/confirmation" &&
         request.path != "/students/sign_out" &&
         !request.xhr?) # don't store ajax calls
       store_location_for(:student, request.fullpath)
      elsif (request.path != "/tourists/sign_in" &&
         request.path != "/tourists/sign_up" &&
         request.path != "/tourists/password/new" &&
         request.path != "/tourists/password/edit" &&
         request.path != "/tourists/confirmation" &&
         request.path != "/tourists/sign_out" &&
         !request.xhr?) # don't store ajax calls
       store_location_for(:student, request.fullpath)
     end
   end

  def after_sign_out_path_for(type)
    if type == :student
      root_path
    else
      root_path
    end
  end

  protected

  def configure_permitted_parameters
    if resource_class == Student
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name, :last_name, :email, :photo_url, :interests, :year_in_college, :living_situation, :hometown, :password, :password_confirmation).merge(school: School.find(params[:school_id]))}
      devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:first_name, :last_name, :email, :photo_url, :interests, :year_in_college, :living_situation, :hometown, :password, :password_confirmation, :current_password)}
    end

    if resource_class == Tourist
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name, :last_name, :email, :prospective_major, :intended_start_date_semester, :intended_start_date_year, :password, :password_confirmation)}
      devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:first_name, :last_name, :email, :prospective_major, :intended_start_date_semester, :intended_start_date_year, :password, :password_confirmation, :current_password)}
    end
  end
end
