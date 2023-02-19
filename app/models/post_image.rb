class PostImage < ApplicationRecord
  belongs_to :user
  has_many_attached :images
  #accepts_nested_attributes_for :images

  validates :title, presence: true
  validates :text, presence: true
  validates :images, presence: true

  def get_image(width, height)
    unless images.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'no_image.jpg', content_type: 'image/jpg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end
end
