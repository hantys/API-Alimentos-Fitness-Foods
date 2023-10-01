class ProductSerializer < ActiveModel::Serializer
  attributes :id, :code, :status, :imported_t, :url,
             :creator, :created_t, :last_modified_t, :product_name,
             :quantity, :cities, :purchase_places, :ingredients_text,
             :traces, :serving_size, :serving_quantity, :nutriscore_score,
             :nutriscore_grade, :main_category, :image_url,
             :brands, :categories, :labels, :stores
end
