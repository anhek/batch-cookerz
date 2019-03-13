FactoryBot.define do
  factory :recipe do
    name { Faker::Food.dish }
    description { Faker::Food.description }
    preparation_time { Faker::Number.between(5, 60) }
    cooking_time { Faker::Number.between(15, 60) }
    cost { Faker::Number.decimal(2) }
  end
end