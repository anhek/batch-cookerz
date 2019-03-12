# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ingredient_categories = ["Viande", "Poisson", "Légume", "Fruit", "Légumineuse"]

5.times do |i|
  User.create!(first_name: Faker::Superhero.name, last_name: Faker::Artist.name, email: "email#{i+1}@gmail.com", password: "raph-le-boss")
end
puts "Users created"

RecipeCategory.create!(name: "recipe_category")
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

MenuRecipe.create!(menu_id: 1, recipe_id:1)
puts "Menu_recipe created"

15.times do 
  Ingredient.create!(name: Faker::Food.ingredient, calories: rand(50..250), price: rand(1.5..5.5).round(2), ingredient_category_id: rand(1..5))
end
puts "Ingredients created"

Composition.create(recipe_id: 1, ingredient_id: 1)
puts "Composition created"

Comment.create(recipe_id: 1, description: "comment 1", user_id: 1)
puts "Comment created"

Like.create(recipe_id: 1, user_id: 1)
puts "Like created"
