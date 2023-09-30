class Product < ApplicationRecord
  belongs_to :brand, optional: true
  belongs_to :store, optional: true

  validates_presence_of :product_name
end
