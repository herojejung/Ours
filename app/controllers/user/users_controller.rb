class User::UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
  if @user.update(user_params)
    redirect_to user_users_path
  end
  end

  def index
  end

  def unsubscribe
  end

  def withdrawal
  end

  def destroy_confirm
    @user = current_user
  end

  def destroy_user
    @user = current_user
    if @user.email == 'guestda@example.com'
      reset_session
      redirect_to :root
    else
      @user.update(is_valid: false)
      reset_session
      redirect_to :root
    end
  end

private
  # ストロングパラメータ
def user_params
  params.require(:user).permit(:email,:name,:image)
end

end
