class Product < ApplicationRecord
  enum status: { draft: 0, published: 1, trash: 2 }

  validates_presence_of :product_name
  validates :code, presence: true, uniqueness: true
end
