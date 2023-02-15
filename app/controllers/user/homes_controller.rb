class User::HomesController < ApplicationController
def top
  @post_image = PostImage.where(user_id: @params).where(post_image_id: @params).where(created_at: :desc)
  @post_images = PostImage.all
end

end