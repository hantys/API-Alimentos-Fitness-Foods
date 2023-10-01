FactoryBot.define do
  factory :product do
    code { (Digest::SHA1.hexdigest(SecureRandom.uuid)[0..rand(50)]).downcase }
    status { rand(3) }
    imported_t { "2023-09-30 03:19:11" }
    url { "" }
    creator { Faker::Commerce.material }
    created_t { 1 }
    last_modified_t { 1 }
    product_name { Faker::Commerce.product_name }
    quantity { rand(999999)}
    cities { "" }
    purchase_places { "" }
    ingredients_text { "" }
    traces { "" }
    serving_size { "" }
    serving_quantity { "" }
    nutriscore_score { "" }
    nutriscore_grade { "" }
    main_category { "" }
    brands { Faker::Commerce.brand  }
    image_url { "MyString" }
    categories { "String" }
    labels { "String" }
    stores { "String" }
  end
end
