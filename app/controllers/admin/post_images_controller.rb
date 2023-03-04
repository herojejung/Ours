class Admin::PostImagesController < ApplicationController
  def show
    @post_image = PostImage.find(params[:id])
    @user = @post_image.user
  end

  def edit
  end

  def destroy
    @post_image = PostImage.find(params[:id])
  if @post_image.destroy
    redirect_to admin_root_path
  end
  end

end
