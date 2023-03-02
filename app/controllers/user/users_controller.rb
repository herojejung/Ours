class User::UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @q = @user.articles.ransack(params[:q])
  end

  def edit
    @user = User.find(params[:id])
  end

  def index
    @q = current_user.articles.ransack(params[:q])
    @post_images = @q.result(distinct: true).order(created_at: :desc).page(params[:page]).per(4)
    @liked_post_images = current_user.post_images.order(created_at: :desc).page(params[:page]).per(4)
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_user_path(current_user)
    else
      render "edit"
    end
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
    params.require(:user).permit(:email,:name,:image, :password, :password_confirmation)
  end
end
