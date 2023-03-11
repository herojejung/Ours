class Admin::SubCategoriesController < ApplicationController
  before_action :authenticate_admin!

def index
  @sub_categories = SubCategory.all
  @categories = Category.all
  render 'admin/categories/index'
end

def new
  @sub_category = Category.new.sub_categories.build
end

def create
  sub_category_params = params.require(:sub_category).permit(sub_category_attributes: [:name, :category_id])
  @sub_category = SubCategory.new(sub_category_params)
if @sub_category.save
  flash[:success] = "サブカテゴリを登録しました。"
  redirect_to admin_categories_path
else
  flash.now[:danger] = "登録に失敗しました。"
  render :new
end
end

def edit
  @sub_category = SubCategory.find(params[:id])
  @categories = Category.all
  @sub_categories = SubCategory.all
end

def update
  @sub_category = SubCategory.find(params[:id])
if @sub_category.update(sub_category_params)
  redirect_to admin_categories_path
else
  render :edit
end
end

def destroy
  @sub_category = SubCategory.find(params[:id])
if @sub_category.destroy
  flash[:success] = "サブカテゴリーを削除しました。"
else
  flash[:danger] = "サブカテゴリーの削除に失敗しました。"
end
  redirect_to admin_categories_path
end

private

def sub_category_params
  params.require(:sub_category).permit(sub_categories_attributes: [:name, :category_id])
end
end