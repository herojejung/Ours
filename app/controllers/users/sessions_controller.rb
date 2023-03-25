class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :user_state, only: [:create]
  before_action :set_ransack_variable, only: [:new]


def sign_in_params
  if params[:user].present?
    params.require(:user).permit(:email, :password, :name)
  else
    {}
  end
end

def after_sign_in_path_for(resource)
    root_path
end

def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
end

def after_sign_out_path_for(resource)
    root_path
end

protected
# 退会しているかを判断するメソッド
def user_state
  return unless params[:user].present? # 追加

  if user_signed_in?
    return
  end

  @user = User.find_by(name: params[:user][:name])
  return if !@user&.valid_password?(params[:user][:password])

  if @user.is_deleted == false
    redirect_to new_user_registration_path
  elsif @user.is_deleted == true
    sign_in @user
    redirect_to root_path
  end
end

def set_ransack_variable
    @q = PostImage.none.ransack
end

def get_image(width, height)
  if current_user.image.attached?
    current_user.image.variant(resize_to_limit: [width, height]).processed
  else
    file_path = Rails.root.join('app/assets/images/no_image.jpg')
    current_user.image.attach(io: File.open(file_path), filename: 'no_image.jpg', content_type: 'image/jpg')
    current_user.image.variant(resize_to_limit: [width, height]).processed
  end
end


end

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
