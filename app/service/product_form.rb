class ProductForm
  include ActiveModel::Model

  attr_accessor :code, :status, :imported_t, :url,
                :creator, :created_t, :last_modified_t, :product_name,
                :quantity, :cities, :purchase_places, :ingredients_text,
                :traces, :serving_size, :serving_quantity, :nutriscore_score,
                :nutriscore_grade, :main_category, :image_url,
                :brands, :categories, :labels, :stores

  def save
    Product.create!(product_params)
  rescue ActiveRecord::RecordInvalid => e
    e.record.errors.each { |attr, msg| errors.add(attr, msg) }

    false
  end

  private

  def product_params
    {
      code:, status:, imported_t:, url:, creator:,
      created_t:, last_modified_t:, product_name:,
      purchase_places:, ingredients_text:,
      traces:, serving_size:, serving_quantity:,
      nutriscore_score:, nutriscore_grade:,
      main_category:, quantity:, cities:, image_url:,
      brands:, categories:, labels:, stores:
    }
  end
end
