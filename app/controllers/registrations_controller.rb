class RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  protected

    def user_params
      [
        :name,
        :user_type,
        :phone_number,
        :department
      ]
    end

    def configure_sign_up_params
      devise_parameter_sanitizer.permit(:sign_up, keys: user_params)
    end

    def configure_account_update_params
      devise_parameter_sanitizer.permit(:account_update, keys: user_params)
    end
end
