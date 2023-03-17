class User::HomesController < ApplicationController
  def top
    @q = PostImage.ransack(params[:q])
    if params[:tag].present?
      @post_images = PostImage.tagged_with(params[:tag]).order(created_at: :desc).page(params[:page]).per(4)
    elsif params[:sub_category_id].present?
      @post_images = SubCategory.find(params[:sub_category_id]).post_images.order(created_at: :desc).page(params[:page]).per(4)
    elsif params[:q].present?
      @post_images = @q.result(distinct: true).order(created_at: :desc).page(params[:page]).per(4)
    else
      @post_images = PostImage.all.order(created_at: :desc).page(params[:page]).per(4)
    end
    @tags = PostImage.tag_counts_on(:tags).order('count DESC').limit(10)
    @tags_ranking = PostImage.tag_counts_on(:tags).order('count DESC').limit(10)
    @likes_ranking = PostImage.joins(:likes).group('post_images.id').having('COUNT(likes.id) > 0').order('COUNT(likes.id) DESC').limit(10)
  end

  private

end
