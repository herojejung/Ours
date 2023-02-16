class User::PostImagesController < ApplicationController
before_action :authenticate_user!

  def new
    @post_image = PostImage.new
  end

  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    if @post_image.save
        flash[:succsess] = "You have created book successfully."
        redirect_to user_post_image_path(@post_image.id)
    else
      @user = current_user
      render :new
    end
  end

  def show
    @post_image = PostImage.find(params[:id])
    @user = current_user
    @post_images = PostImage.all
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
  params.require(:post_image).permit(:title,:text,:latitude,:longitude,:user_id,:name,images: [])
end

def correct_user
    @post_image = PostImage.find(params[:id])
    @user = @postimage.user
    redirect_to(user_post_image_path) unless @user == current_user
end

end
