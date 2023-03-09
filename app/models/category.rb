class Category < ApplicationRecord
  has_many :sub_categories

  def sub_category_count
    sub_categories.count
  end

end
