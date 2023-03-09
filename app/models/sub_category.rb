class SubCategory < ApplicationRecord
  belongs_to :category

  scope :by_category, ->(category_id) { where(category_id: category_id) }
end
