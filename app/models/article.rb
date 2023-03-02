class Article < ApplicationRecord
  belongs_to :user
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

  scope :with_tags, -> (tag_names) { joins(:tags).where(tags: { name: tag_names }).distinct }

  ransacker :title_or_text_or_tags_name_cont do
    Arel.sql("LOWER(title) LIKE '%#{query.downcase}%' OR LOWER(text) LIKE '%#{query.downcase}%' OR LOWER(tags.name) LIKE '%#{query.downcase}%'")
  end
end
