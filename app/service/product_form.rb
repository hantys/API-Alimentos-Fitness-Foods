class ProductForm
  include ActiveModel::Model

  attr_reader :product
  attr_accessor :code, :status, :imported_t, :url,
                :creator, :created_t, :last_modified_t, :product_name,
                :quantity, :cities, :purchase_places, :ingredients_text,
                :traces, :serving_size, :serving_quantity, :nutriscore_score,
                :nutriscore_grade, :main_category, :brand_id, :store_id, :image_url,
                :brands, :categories, :labels, :stores

  def save
    transaction do
      product_create
      brand_create
      categories_create
      label_create
      store_create
    end
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
      main_category:, brand_id:, store_id:,
      quantity:, cities:, image_url:
    }
  end

  def product_create
    Product.create!(product_params)
  end

  def brand_create
    brands
    # "brands": "La Cestera",
  end

  def categories_create
    # "categories": "Lanches comida, Lanches doces, Biscoitos e Bolos, Bolos, Madalenas",
  end

  def labels_create
    # "labels": "Contem gluten, Contém derivados de ovos, Contém ovos",
  end

  def store_create
    # "stores": "Lidl",
  end
end
