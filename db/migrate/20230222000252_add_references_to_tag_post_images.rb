class AddReferencesToTagPostImages < ActiveRecord::Migration[6.1]
  def change
    add_reference :tag_post_images, :post_image, null: false, foreign_key: true
    add_reference :tag_post_images, :tag, null: false, foreign_key: true
  end
end
