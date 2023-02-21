class AddPostImageIdToPostImages < ActiveRecord::Migration[6.1]
  def up
    add_column :post_images, :post_image_id, :integer
  end

  def down
    remove_column :post_images, :post_image_id
  end
end
