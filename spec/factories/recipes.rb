FactoryBot.define do
  factory :recipe do
    name { Faker::Food.dish }
    description { Faker::Food.description }
    preparation_time { Faker::Number.between(5, 60) }
    cooking_time { Faker::Number.between(15, 60) }
    price_indicator { Faker::Number.between(1, 5) }
    recipe_category_id { rand(1..3) }
    user_id { 1 }
  end
end