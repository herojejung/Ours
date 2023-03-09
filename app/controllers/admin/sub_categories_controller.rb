class Admin::SubCategoriesController < ApplicationController
  before_action :authenticate_admin!

  def index
    @sub_categories = SubCategory.all
    render "admin/sub_categories/index"
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "カテゴリーを登録しました。"
      redirect_to admin_categories_path
    else
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end

# app/controllers/admin/sub_categories_controller.rb
class Admin::SubCategoriesController < ApplicationController
  before_action :authenticate_admin!

  def index
    @sub_categories = SubCategory.all
  end

  def new
    @sub_category = SubCategory.new
    @categories = Category.all
  end

  def create
    @sub_category = SubCategory.new(sub_category_params)
    if @sub_category.save
      flash[:success] = "サブカテゴリーを登録しました。"
      redirect_to admin_sub_categories_path
    else
      @categories = Category.all
      render :new
    end
  end

  private

  def sub_category_params
    params.require(:sub_category).permit(:name, :category_id)
  end
end