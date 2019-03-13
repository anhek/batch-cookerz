# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ingredient_categories = ["Viande", "Poisson", "Légume", "Fruit", "Légumineuse"]
recipes_categories = ["Végétarienne", "Omnivore", "Végétalienne"]

5.times do |i|
  User.create!(first_name: Faker::Superhero.name, last_name: Faker::Artist.name, email: "email#{i+1}@gmail.com", password: "raphleboss69", nickname: Faker::Internet.username(5..8))
end
puts "Users created"

recipe_categories = ["Omnivore", "Végétarien", "Végane"]
3.times do |i|
  RecipeCategory.create!(name: recipe_categories[i])
end
puts "Recipe_category created"

5.times do |i| 
  IngredientCategory.create!(name: ingredient_categories[i])
end
puts "Ingredient_categories created"


5.times do 
  Recipe.create!(name: Faker::Food.dish , description: Faker::Food.description, preparation_time: rand(10..25), cooking_time: rand(10..35), cost: rand(11.2..76.9).round(2), recipe_category_id: 1)
end
puts "Recipe created"

Menu.create!(number_of_recipes: 1, user_id: 1)
puts "Menu created"

	Menu.create!(number_of_recipes:3 , user_id: 1)

3.times do |i|
	MenuRecipe.create!(menu_id: 1, recipe_id:i+1)
end

Ingredient.create!(name: "carotte", calories: rand(50..250), price: rand(1.5..5.5).round(2), ingredient_category_id: rand(1..5))
Ingredient.create!(name: "patate", calories: rand(50..250), price: rand(1.5..5.5).round(2), ingredient_category_id: rand(1..5))
15.times do 
  Ingredient.create!(name: Faker::Food.ingredient, calories: rand(50..250), price: rand(1.5..5.5).round(2), ingredient_category_id: rand(1..5))
end
puts "Ingredients created"

5.times do |i|
  Composition.create(recipe_id: 1, ingredient_id: i+1)
  Composition.create(recipe_id: 2, ingredient_id: i+1)
end

puts "Composition created"

Comment.create(recipe_id: 1, description: "comment 1", user_id: 1)
puts "Comment created"

Like.create(recipe_id: 1, user_id: 1)
puts "Like created"
