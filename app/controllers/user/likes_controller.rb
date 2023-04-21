class User::LikesController < ApplicationController
  before_action :set_post_image
  before_action :check_user_liked, only: :create
  before_action :check_user_unliked, only: :destroy

  def index
  end

  def create
    @post_image = PostImage.find(params[:post_image_id])
    current_user.likes.create(post_image: @post_image)
     respond_to do |format|
    format.js { render :create }
  end
  end

  def destroy
    @post_image = PostImage.find(params[:post_image_id])
    current_user.likes.find_by(post_image: @post_image).destroy
     respond_to do |format|
    format.js { render :destroy }
  end
  end


private

  def set_post_image
    @post_image = PostImage.find(params[:post_image_id])
  end

  def check_user_liked
    redirect_to root_path if @post_image.likes.exists?(user_id: current_user.id)
  end

  def check_user_unliked
    redirect_to root_path unless @post_image.likes.exists?(user_id: current_user.id)
  end

end
