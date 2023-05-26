class User::UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @q = @user.articles.ransack(params[:q], search_key: :article_search)
  end

  def edit
    @user = User.find(params[:id])
    @q = current_user.articles.ransack(params[:q], search_key: :article_search)
  end

def index
  @user = params[:id] ? User.find(params[:id]) : current_user
  @q = @user.articles.ransack(params[:q], search_key: :article_search)
  @post_images = @q.result(distinct: true).where(user: @user).order(created_at: :desc).page(params[:page]).per(4)

  @liked_post_images = PostImage.joins(:likes).where(likes: { user_id: @user.id }).order(created_at: :desc).page(params[:page]).per(4)
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
  @user = current_user
  if @user.email == 'guest@example.com' # ゲストユーザーの場合
    reset_session
    redirect_to edit_user_user_path, notice: "ゲストユーザーは退会できません。" and return
  else
    @user.update(is_deleted: false) # 退会処理を実行
    reset_session
    redirect_to root_path, notice: "退会が完了しました。" and return
  end
end

  def destroy_confirm
    @user = current_user
  end

  private
  # ストロングパラメータ
  def user_params
    params.require(:user).permit(:email,:name,:image, :password, :password_confirmation)
  end
end
