class User::HomesController < ApplicationController
def top
  @post_images = PostImage.where(user_id: params[:user_id], post_image_id: params[:post_image_id]).order(created_at: :desc)
end

end