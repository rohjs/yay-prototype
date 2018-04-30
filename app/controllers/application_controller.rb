class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale

  layout "dashboard", only: [:edit, :update, :show], if: :devise_controller?

  def after_sign_in_path_for(resource)
    dashboard_path(resource.id)
  end


  protected

  def configure_permitted_parameters
    keys = [:name, :user_type, :profile, :department, :phone_number, :email, :password, :password_confirmation]
    devise_parameter_sanitizer.permit(:sign_up, keys: keys)
    devise_parameter_sanitizer.permit(:account_update, keys: keys)
  end

  def set_locale
    locale = params[:locale].to_s.strip.to_sym
    I18n.locale = I18n.available_locales.include?(locale) ? locale : I18n.default_locale
  end

end
