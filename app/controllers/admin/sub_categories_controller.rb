# app/controllers/admin/sub_categories_controller.rb
class Admin::SubCategoriesController < ApplicationController
  before_action :authenticate_admin!

  def index
    @sub_categories = SubCategory.all
  end

  def new
    @sub_category = SubCategory.new
    @categories = Category.all
    @sub_categories = SubCategory.all # 追加する
  end

  def create
    if sub_category_params[:sub_categories].present?
      sub_category_params[:sub_categories].each do |sub_category_param|
      @sub_category = SubCategory.new(sub_category_param)
    unless @sub_category.save
      @categories = Category.all
      render :new and return
    end
    end
      flash[:success] = "サブカテゴリーを登録しました。"
      redirect_to admin_categories_path
    else
      flash[:error] = "サブカテゴリーがありません。"
      redirect_to new_admin_sub_category_path
    end
  end

  def edit
    @sub_category = SubCategory.find(params[:id])
    @categories = Category.all
  end

  def update
    @sub_category = SubCategory.find(params[:id])
  if @sub_category.update(sub_category_params)
    redirect_to admin_categories_path
  end
  end

  def destroy
    @sub_category = SubCategory.find(params[:id])
    @sub_category.destroy
    flash[:success] = "サブカテゴリーを削除しました。"
    redirect_to admin_categories_path
  end

  private

  def sub_category_params
    params.require(:sub_category).permit(:name, :category_id)
  end


end