class User::LikesController < ApplicationController
  def index
  end

  def create
    @post_image = PostImage.find(params[:post_image_id])
    current_user.likes.create(post_image: @post_image)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @post_image = PostImage.find(params[:post_image_id])
    current_user.likes.find_by(post_image: @post_image).destroy
    redirect_back(fallback_location: root_path)
  end


  def show
  end
end
