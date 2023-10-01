class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.integer :code
      t.integer :status, default: 0
      t.datetime :imported_t
      t.string :url
      t.string :creator
      t.integer :created_t
      t.integer :last_modified_t
      t.string :product_name
      t.string :quantity
      t.string :cities
      t.string :purchase_places
      t.text :ingredients_text
      t.text :traces
      t.string :serving_size
      t.string :serving_quantity
      t.string :nutriscore_score
      t.string :nutriscore_grade
      t.string :main_category
      t.references :brand, foreign_key: true
      t.references :store, foreign_key: true
      t.string :image_url

      t.timestamps
    end
  end
end
