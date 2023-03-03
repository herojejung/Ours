class Admins::ApplicationController < ActionController::Base
  # 管理者ログイン認証を行う
  before_action :authenticate_admin!
  before_action :set_ransack_variable, unless: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit :sign_in, keys: [:email,:password]
  end

  def set_ransack_variable
    @q = Admin.ransack(params[:q])
  end

  # 管理者としてログインしていなければ、ログイン画面にリダイレクトする
  def authenticate_admin!
    redirect_to new_admin_session_path unless current_admin
  end
end