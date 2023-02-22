class Tag < ApplicationRecord
  has_many :tag_post_images
  has_many :post_images, through: :tag_post_images
end
