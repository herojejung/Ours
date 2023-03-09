class PostImage < ApplicationRecord
  belongs_to :home, optional: true
  belongs_to :user
  has_many_attached :images
  has_many :comments
  has_many :likes
  has_many :liked_users, through: :likes, source: :user
  #accepts_nested_attributes_for :images
  acts_as_taggable_on :tags

  accepts_nested_attributes_for :comments, allow_destroy: true

  attr_accessor :tag_names
  
  enum category: { category1: 0, category2: 1, category3: 2 }
  enum subcategory: { subcategory1: 0, subcategory2: 1, subcategory3: 2 }

def self.search(query)
  if query.present?
    joins(:tags).where("title LIKE :query OR text LIKE :query OR tags.name LIKE :query", query: "#{query}").distinct
  else
    all
  end
end

  def related_posts
    PostImage.tagged_with(tag_names, any: true)
  end


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
