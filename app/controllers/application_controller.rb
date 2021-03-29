class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :authenticate_user!

    around_action :switch_locale

    protected

    def switch_locale(&action)
      lang = params[:lang] || session[:lang] || I18n.default_locale
      session[:lang] = params[:lang] if params[:lang]
      I18n.with_locale(lang, &action)
    end

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
    end

    def full_name
        "#{current_user.first_name} #{current_user.last_name}"
    end
end
