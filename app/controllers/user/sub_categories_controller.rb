class User::SubCategoriesController < ApplicationController
  def index
    category_id = params[:category_id]
    @category = Category.find_by(id: category_id)
    @sub_categories = SubCategory.where(category_id: category_id)

    if category_id.blank? || @sub_categories.empty?
      render json: { error: 'No sub categories found for the given category ID' }, status: :not_found
    else
      respond_to do |format|
        format.json { render json: @sub_categories }
        format.html # もしHTMLリクエストが送られてきた場合は何もしない
      end
    end
  end
end
