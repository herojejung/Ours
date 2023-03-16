class User::HomesController < ApplicationController
  def top
    @q = PostImage.ransack(params[:q])
    if params[:tag].present?
      @post_images = PostImage.tagged_with(params[:tag]).order(created_at: :desc).page(params[:page]).per(5)
    elsif params[:sub_category_id].present?
      @post_images = SubCategory.find(params[:sub_category_id]).post_images.order(created_at: :desc).page(params[:page]).per(5)
    elsif params[:q].present?
      @post_images = @q.result(distinct: true).order(created_at: :desc).page(params[:page]).per(5)
    else
      @post_images = PostImage.all.order(created_at: :desc).page(params[:page]).per(5)
    end
    @tags = PostImage.tag_counts_on(:tags)
  end

  private

end
