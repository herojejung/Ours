class Admin::CommentsController < ApplicationController
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to admin_post_image_path(@comment.post_image)
  end
end