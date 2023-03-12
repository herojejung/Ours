class Category < ApplicationRecord
has_many :sub_categories, inverse_of: :category, dependent: :destroy
accepts_nested_attributes_for :sub_categories, allow_destroy: true, reject_if: :all_blank

def sub_category_count
sub_categories.count
end
end