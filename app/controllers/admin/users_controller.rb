class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_ransack_variable, only: [:index]


  def index
    @users = @q.result(distinct: true)
  end

  private

  def set_ransack_variable
    @q = User.ransack(params[:q])
  end


  def authenticate_admin!
    authenticate_user!
    redirect_to admin_root_path unless current_user.admin?
  end
end