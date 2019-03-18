FactoryBot.define do
  factory :ingredient do
    name { Faker::Food.ingredient }
    calories { Faker::Number.within(1..10) }
    ingredient_category_id { rand(1..5) }
  end
end