class PostImage < ApplicationRecord
  belongs_to :home, optional: true
  belongs_to :user
  has_many_attached :images
  has_many :comments
  #accepts_nested_attributes_for :images
  acts_as_taggable_on :tags
  
  accepts_nested_attributes_for :comments, allow_destroy: true

  attr_accessor :tag_names

  before_save do
  if tag_names.present?
    self.tags = tag_names.map do |name|
    Tag.where(name: name.strip).first_or_create!
  end
  end
  end
  
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
