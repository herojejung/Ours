class User::CommentsController < ApplicationController
def create
  @post_image = PostImage.find(params[:post_image_id])
  @comment = @post_image.comments.build(comment_params)
  @comment.user_id = current_user.id
  respond_to do |f|
if @comment.save
  f.html { redirect_to user_post_image_path(@post_image) }
else
  f.html { redirect_to user_post_image_path(@post_image), alert: "コメントの投稿に失敗しました" }
end
end
end

def destroy
end

private

def comment_params
  params.require(:comment).permit(:content)
end
end

