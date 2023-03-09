class Admin::CategoriesController < ApplicationController
  before_action :authenticate_admin!

  def index
    @categories = Category.all
    @category = Category.new
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

  def edit
    @category = Category.find(params[:id])
    @sub_categories = @category.sub_categories
  end

  def update
    @category = Category.find(params[:id])
  if @category.update(category_params)
    redirect_to admin_categories_path
  end
  end

  private

  def category_params
    params.require(:category).permit(:name, sub_categories_attributes: [:id, :name, :_destroy])
  end
end