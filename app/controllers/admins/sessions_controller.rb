class Admins::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :set_ransack_variable, only: [:new]
  # GET /resource/sign_in
  # def new
  #   super
  # end

  def create
    self.resource = warden.authenticate!(auth_options)
    set_flash_message!(:notice, :signed_in)
    sign_in(resource_name, resource)
    yield resource if block_given?
    respond_with resource, location: after_sign_in_path_for(resource)
  end

  protected

  def after_sign_in_path_for(resource)
    admin_root_path
  end

  def after_sign_out_path_for(resource)
    new_admin_session_path
  end

  def set_ransack_variable
    # Admins::SessionsControllerでは検索フォームが不要のため、空の検索オブジェクトを代入する
    @q = PostImage.none.ransack
  end
end
