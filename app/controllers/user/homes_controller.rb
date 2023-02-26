class User::HomesController < ApplicationController
  def top
    @q = PostImage.ransack(params[:q])
    @post_images = @q.result(distinct: true).order(created_at: :desc).page(params[:page]).per(5)
  end
end
