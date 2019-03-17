FactoryBot.define do
  factory :shopping_list do
    ingredients_qty { 1 }
    price { "9.99" }
    menu { nil }
  end
end
