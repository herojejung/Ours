class AddReferencesToTagPostImages < ActiveRecord::Migration[6.1]
  def change
      add_reference(:tag_post_images, :post_image, foreign_key: true)
      change_column_null :tag_post_images, :post_image_id, true
  end
end
