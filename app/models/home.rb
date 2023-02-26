class Home < ApplicationRecord
  has_many :post_images

  def self.ransackable_attributes(auth_object = nil)
    ['title', 'text']
  end
end
