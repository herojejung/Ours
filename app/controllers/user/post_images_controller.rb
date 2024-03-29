class User::PostImagesController < ApplicationController
before_action :authenticate_user!
before_action :correct_user, only: [:edit, :update, :destroy]

  def new
    @post_image = PostImage.new
    @q = PostImage.ransack(params[:q])
    @category_id = params[:post_image][:category_id] if params[:post_image]
  end

def create
  @post_image = PostImage.new(post_image_params)
  @post_image.user_id = current_user.id
  category = Category.find_by(id: params[:post_image][:category_id])
  @post_image.category_id = category.id if category.present?
  @post_image.tag_list.add(params[:post_image][:tag_list], parse: true)
  if @post_image.save
    flash[:success] = "投稿が完了しました。"
    redirect_to user_post_image_path(@post_image.id)
  else
    @user = current_user
    render :new
  end
end

def index
  if params[:tag].present?
    @tag_name = params[:tag] # 追加: タグ名を取得
    @post_images = PostImage.tagged_with(@tag_name).order(created_at: :desc)
    @related_posts = @post_images.first.related_posts if @post_images.present?
  else
    @post_images = PostImage.order(created_at: :desc)
  end
    @q = @post_images.ransack(params[:q])
    @post_images = @q.result(distinct: true)
end

  def show
    @post_image = PostImage.find(params[:id])
    @tags = @post_image.tags
    @user = User.find(@post_image.user_id)
    @postimages = PostImage.all
    @comment = Comment.new
    @comments = @post_image.comments
    @q = PostImage.ransack(params[:q])
  end

  def edit
    @post_image = PostImage.find(params[:id])
    @post_image.tag_names = @post_image.tags.map(&:name).join("#,#")
  end

def update
  @post_image = PostImage.find(params[:id])
  @post_image.tag_list.add(params[:post_image][:tag_list].split(","))
  if @post_image.update(post_image_params)
    redirect_to user_post_image_path
  end
end

  def destroy
    @post_image = PostImage.find(params[:id])
    @post_image.user_id  = current_user.id
  if @post_image.destroy
    redirect_to user_root_path
  end
  end

private
  # ストロングパラメータ
def post_image_params
  params.require(:post_image).permit(:context,:tag_list,:title,:text,:latitude,:longitude,:user_id,:name,:category_id,:sub_category_id,:category,:subcategory,images: [])
end
def correct_user
  @post_image = PostImage.find(params[:id])
  redirect_to root_path unless @post_image.user == current_user
end
end