class SubCategory < ApplicationRecord
belongs_to :category
validates :name, presence: true

scope :by_category, ->(category_id) { where(category_id: category_id) }
end