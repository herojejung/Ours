class AddUserAndPostImageReferencesToLikes < ActiveRecord::Migration[6.1]
  def change
    add_reference :likes, :user, null: false, foreign_key: true
    add_reference :likes, :post_image, null: false, foreign_key: true
  end
end
