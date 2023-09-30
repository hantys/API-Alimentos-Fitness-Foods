FactoryBot.define do
  factory :label do
    name { Faker::Commerce.material }
  end
end
