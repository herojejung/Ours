class User::PostImagesController < ApplicationController
before_action :authenticate_user!

  def new
    @post_image = PostImage.new
  end

  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.save ? (redirect_to user_post_image_path(@post_image)) : (render :new)
  end

  def show
    @post_image = PostImage.find(params[:id])
    @user = current_user
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
  params.require(:post_image).permit(:title,:text,:latitude,:longitude,:user_id,:name,images_attributes: [:image])
end


end
