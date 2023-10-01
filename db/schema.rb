# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_09_30_192130) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "platforms", force: :cascade do |t|
    t.string "name"
    t.string "key"
    t.string "secret"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["secret"], name: "index_platforms_on_secret"
  end

  create_table "products", force: :cascade do |t|
    t.string "code"
    t.integer "status", default: 0
    t.datetime "imported_t"
    t.string "url"
    t.string "creator"
    t.integer "created_t"
    t.integer "last_modified_t"
    t.string "product_name"
    t.string "quantity"
    t.string "cities"
    t.string "purchase_places"
    t.text "ingredients_text"
    t.text "traces"
    t.string "serving_size"
    t.string "serving_quantity"
    t.string "nutriscore_score"
    t.string "nutriscore_grade"
    t.string "main_category"
    t.string "brands"
    t.string "categories"
    t.string "labels"
    t.string "stores"
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_products_on_code"
  end

end
