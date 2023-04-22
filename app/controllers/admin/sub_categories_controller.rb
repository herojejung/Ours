class Admin::SubCategoriesController < ApplicationController
  before_action :authenticate_admin!

  def create
    @category = Category.find(params[:category_id])
    @sub_category = @category.sub_categories.build(sub_category_params)
    if @sub_category.save
      flash[:success] = "サブカテゴリーを作成しました"
    else
      flash[:error] = "サブカテゴリーの作成に失敗しました"
    end
    redirect_to edit_admin_category_path(@category)
  end

  def update
    @category = Category.find(params[:category_id])
    @sub_category = SubCategory.find(params[:id])
    if @sub_category.update(sub_category_params)
      flash[:success] = "サブカテゴリーを更新しました"
    else
      flash[:error] = "サブカテゴリーの更新に失敗しました"
    end
    redirect_to edit_admin_category_path(@category)
  end

  def destroy
    @category = Category.find(params[:category_id])
    @sub_category = SubCategory.find(params[:id])
    if @sub_category.destroy
      flash[:success] = "サブカテゴリーを削除しました"
    else
      flash[:error] = "サブカテゴリーを削除できませんでした"
    end
    redirect_to edit_admin_category_path(@category)
  end

  private

  def sub_category_params
    params.require(:sub_category).permit(:name, :category_id)
  end
end
