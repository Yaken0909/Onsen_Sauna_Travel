class ApplicationController < ActionController::Base
  # Devise利用時のストロングパラメータ設定
  before_action :configure_permitted_parameters, if: :devise_controller?

  # ログイン後の遷移先
  def after_sign_in_path_for(resource)
    post_images_path
  end

  # ログアウト後の遷移先
  def after_sign_out_path_for(resource)
    homes_about_path
  end

  protected

  # Deviseの許可パラメータ追加（ユーザー登録時とアカウント編集時）
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :profile_image])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :profile_image])
  end
end