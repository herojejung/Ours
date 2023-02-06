class ApplicationController < ActionController::Base
before_action :authenticate_user! # 追加

  protected

  def configure_permitted_parameters
    added_attrs = [ :name, :email, :password, ]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
  end
end
