class User::LikesController < ApplicationController

  def create
    @post_image = PostImage.find(params[:post_image_id])
      current_user.likes.create(post_image: @post_image)
    respond_to do |format|
      format.js { render :update_likes_count }
    end
  end

  def destroy
    @post_image = PostImage.find(params[:post_image_id])
    current_user.likes.find_by(post_image: @post_image).destroy
    respond_to do |format|
      format.js { render :update_likes_count }
    end
  end
end
