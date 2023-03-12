class Admin::CategoriesController < ApplicationController
  before_action :authenticate_admin!

  def new
    @category = Category.new
    @category.sub_categories.build
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "Category created successfully"
      redirect_to admin_categories_path
    else
      render :new
    end
  end

  def index
    @categories = Category.all
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      flash[:success] = "Category updated successfully"
      redirect_to admin_categories_path
    else
      render :edit
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, sub_categories_attributes: [:id, :name, :category_id, :_destroy])
  end
end