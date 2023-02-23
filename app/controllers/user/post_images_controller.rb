class User::PostImagesController < ApplicationController
before_action :authenticate_user!
before_action :correct_user, only: [:edit, :update, :destroy]

  def new
    @post_image = PostImage.new
  end

  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    tag_list = params[:post_image][:tag_list] # 追加
    # tag_listの中身が空でない場合は、post_imageにタグを追加する
    @post_image.tag_list.add(tag_list.split(",")) if tag_list.present? # 追加
    if @post_image.save
      flash[:succsess] = "投稿が完了しました."
      redirect_to user_post_image_path(@post_image.id)
    else
      @user = current_user
      render :new
    end
  end

  def index

  end

  def show
    @post_image = PostImage.find(params[:id])
    @tags = @post_image.tags
    @user = current_user
    @postimages = PostImage.all
  end

  def edit
    @post_image = PostImage.find(params[:id])
    @post_image.tag_names = @post_image.tags.map(&:name).join("#,#")
  end

def update
  @post_image = PostImage.find(params[:id])
  @post_image.tag_names = params[:post_image][:tag_names]
  tag_names = params[:post_image][:tag_names].split("#,#")
  tag_names.each do |tag_name|
    tag = Tag.find_or_create_by(name: tag_name)
    @post_image.tags << tag
  end
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
  params.require(:post_image).permit(:tag_name,:title,:text,:latitude,:longitude,:user_id,:name,images: [])
end

def correct_user
  @post_image = PostImage.find(params[:id])
  redirect_to user_root_path unless @post_image.user == current_user
end


end
