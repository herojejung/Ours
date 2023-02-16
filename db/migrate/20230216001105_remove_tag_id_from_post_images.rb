class RemoveTagIdFromPostImages < ActiveRecord::Migration[6.1]
  def change
    remove_column :post_images, :tag_id, :integer
    remove_column :post_images, :tag_id, :integer
    remove_column :post_images, :tag_id, :integer
  end
end
