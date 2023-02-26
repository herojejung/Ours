class User::HomesController < ApplicationController
  def top
    @q = PostImage.ransack(params[:q])
    @post_images = @q.result(distinct: true).order(created_at: :desc).page(params[:page]).per(5)

    # タグ検索用のフィールドを追加する
    @tags = PostImage.tag_counts_on(:tags)

    # タグ検索条件を追加する
    if params[:tag].present?
      @post_images = @post_images.tagged_with(params[:tag])
    end
  end
end
