class Admin::HomesController < ApplicationController
  def top
    @q = PostImage.ransack(params[:q])
    @post_images = @q.result(distinct: true)
  end
end
