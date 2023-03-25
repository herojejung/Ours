class AddCategoryIdAndSubcategoryIdToPostImages < ActiveRecord::Migration[6.1]
  def change
    add_column :post_images, :category_id, :bigint
    add_column :post_images, :sub_category_id, :bigint
    add_foreign_key :post_images, :categories, column: :category_id
    add_foreign_key :post_images, :sub_categories, column: :sub_category_id
  end
end
