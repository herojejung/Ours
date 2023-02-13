class User::PostImagesController < ApplicationController
before_action :authenticate_user!

  def new
    @post_image = PostImage.new
  end

  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.save ? (redirect_to user_root_path(@post_image)) : (render :new)
  end

  def show
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
  end

private
  # ストロングパラメータ
def post_image_params
  params.require(:post_images).permit(:title,:text,:image,:latitude,:longitude,:user_id,:tag_id)
end


end
