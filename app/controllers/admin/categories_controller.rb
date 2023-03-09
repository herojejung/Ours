class Admin::CategoriesController < ApplicationController
  before_action :authenticate_admin!

  def index
    @categories = Category.all
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

  def show
    @category = Category.find(params[:id])
    @sub_categories = @category.sub_categories
  end


  private

  def category_params
    params.require(:category).permit(:name, sub_categories_attributes: [:id, :name, :_destroy])
  end
end