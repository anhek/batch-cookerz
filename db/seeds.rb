# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do |i|
  User.create!(email: "email#{i+1}@gmail.com", password: "raph-le-boss")
end
puts "user cree"
	RecipeCategory.create!(name: "recipe_category")
	puts "recipecategory cree"
	IngredientCategory.create!(name: "ingredient_category")
	puts "ingredientcategory cree"
	

5.times do 
	Recipe.create!(name: Faker::Food.dish , description: Faker::Food.description, preparation_time: rand(10..25), cooking_time: rand(10..35), cost: rand(11.2..76.9).round(2), recipe_category_id: 1)
end

	puts "recipe cree"
	Menu.create!(number_of_recipes: 1, user_id: 1)
	puts "menu cree"
	MenuRecipe.create!(menu_id: 1, recipe_id:1)
	puts "menurecipe cree"
	Ingredient.create!(name: "ingredient 1", ingredient_category_id: 1)
	puts "ingredient cree"
	Composition.create(recipe_id: 1, ingredient_id: 1)
	puts "composition cree"
	Comment.create(recipe_id: 1, description: "comment 1", user_id: 1)
	puts "comment cree"
	Like.create(recipe_id: 1, user_id: 1)
	puts "like cree"
