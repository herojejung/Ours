class User::PostsController < ApplicationController
before_action :authenticate_user!

  def new
    @post = Post.new
  end

  def create
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
def post_images_params
  params.require(:post_images).permit(:email,:name,:image)
end


end
