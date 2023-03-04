class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_ransack_variable, only: [:index]

  def index
    @users = @q.result(distinct: true).order(created_at: :desc).page(params[:page]).per(5)
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
  if @user.destroy
    redirect_to admin_users_path
  end
  end

  private

  def set_ransack_variable
    @q = User.ransack(params[:q])
  end

end