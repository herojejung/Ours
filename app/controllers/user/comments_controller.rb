class User::CommentsController < ApplicationController

def index
  @post_image = PostImage.find(params[:post_image_id])
  @comments = @post_image.comments
end

def create
  @post_image = PostImage.find(params[:post_image_id])
  @comment = @post_image.comments.build(comment_params)
  @comment.user_id = current_user.id
  respond_to do |f|
if @comment.save
  f.html { redirect_to user_post_image_comments_path(@post_image) }
else
  f.html { redirect_to user_post_image_path(@post_image), alert: "コメントの投稿に失敗しました" }
end
end
end

def destroy
  @comment = Comment.find(params[:id])
  @post_image = @comment.post_image
  @comment.destroy
  redirect_to user_post_image_path(@post_image), notice: 'コメントが削除されました'
end

private

def comment_params
  params.require(:comment).permit(:content,:user_id,:post_image_id,:category_id,:sub_category_id,:category,:subcategory,images: [])
end
end

