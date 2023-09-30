FactoryBot.define do
  factory :product do
    code { 1 }
    status { 1 }
    imported_t { "2023-09-30 03:19:11" }
    url { "MyString" }
    creator { "MyString" }
    created_t { 1 }
    last_modified_t { 1 }
    product_name { "MyString" }
    quantity { "MyString" }
    cities { "MyString" }
    purchase_places { "MyString" }
    ingredients_text { "MyText" }
    traces { "MyText" }
    serving_size { "MyString" }
    serving_quantity { "MyString" }
    nutriscore_score { "MyString" }
    nutriscore_grade { "MyString" }
    main_category { "MyString" }
    brand { nil }
    store { nil }
    image_url { "MyString" }
  end
end
