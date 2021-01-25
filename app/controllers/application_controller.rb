class ApplicationController < ActionController::Base
  # before_action :authenticate_user!

  # ↓これを追加↓
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :text, :gender, :prefecture_id, :avatar])
      devise_parameter_sanitizer.permit(:sign_up, keys: [:account_update, :text, :gender, :prefecture_id, :avatar])
    end
# ↑ここまで↑
end