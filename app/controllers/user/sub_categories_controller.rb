class User::SubCategoriesController < ApplicationController
  def index
    category_id = params[:category_id]
    @sub_categories = SubCategory.where(category_id: category_id)

    respond_to do |format|
      format.json { render json: @sub_categories }
    end
  end
end
