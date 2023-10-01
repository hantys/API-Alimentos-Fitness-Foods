class Product < ApplicationRecord
  belongs_to :brand, optional: true
  belongs_to :store, optional: true

  has_many :categories, dependent: :destroy
  has_many :labels, dependent: :destroy

  accepts_nested_attributes_for :categories, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :labels, reject_if: :all_blank, allow_destroy: true

  enum status: { draft: 0, published: 1, trash: 2 }

  validates_presence_of :product_name
end
