# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ingredient_categories = ["Viande", "Poisson", "Légume", "Fruit", "Légumineuse"]

User.create!(first_name: "Maïté", last_name: "Ordonez", email: "maite@thp.org", password: "jaifaim", nickname: "Super Maïté")

5.times do |i|
  User.create!(first_name: Faker::Superhero.name, last_name: Faker::Artist.name, email: "email#{i+1}@gmail.com", password: "raphleboss69", nickname: Faker::Internet.username(5..8))
end
puts "Users created"

recipe_categories = ["Omnivore", "Végétarien", "Végétalien"]
3.times do |i|
  RecipeCategory.create!(name: recipe_categories[i])
end
puts "Recipe_category created"

5.times do |i| 
  IngredientCategory.create!(name: ingredient_categories[i])
end
puts "Ingredient_categories created"
 
Recipe.create!(name: "Poêlée au tofu" , description: "Etape 1

Faire cuire le riz dans une casserole d'eau bouillante. Pendant ce temps, faites revenir dans une poêle les échalotes avec l'huile d'olive.

Coupez le tofu en dés assez fins et les ajouter dans la poêle avec les échalotes.
Etape 3

Rajouter ensuite la julienne de légumes.
Etape 4

Bien mélanger.
Etape 5

Laisser mijoter 5 min.
Etape 6

Quand le riz est cuit, incorporez le dans la poêle et assaisonnez de sel et poivre.
Etape 7

Enfin, rajouter la sauce soja. Laisser cuire encore 5 min et voilà", preparation_time: 20, cooking_time: 15, price_indicator: 1, recipe_category_id: 3, user_id:1)

Recipe.create!(name: "Ratatouille" , description: "Etape 1

Coupez les tomates pelées en quartiers,
Etape 2

les aubergines et les courgettes en rondelles.
Etape 3

Emincez les poivrons en lamelles
Etape 4

et l'oignon en rouelles.
Etape 5

Chauffez 2 cuillères à soupe d'huile dans une poêle
Etape 6

et faites-y fondre les oignons et les poivrons.
Etape 7

Lorsqu'ils sont tendres, ajoutez les tomates, l'ail haché, le thym et le laurier.
Etape 8

Salez, poivrez et laissez mijoter doucement à couvert durant 45 minutes.
Etape 9

Pendant ce temps, préparez les aubergines et les courgettes. Faites les cuire séparemment ou non dans l'huile d'olive pendant 15 minutes.
Etape 10

Vérifiez la cuisson des légumes pour qu'ils ne soient plus fermes. Ajoutez les alors au mélange de tomates et prolongez la cuisson sur tout petit feu pendant 10 min.
Etape 11

Salez et poivrez si besoin.", preparation_time: 25, cooking_time: 55, price_indicator: 2, recipe_category_id: 3, user_id:2)

Recipe.create!(name: "Scampis à l'italienne" , description: "Etape 1

Plongez les scampis 2 mn dans l'eau très chaude pour les décortiquer facilement. Epongez les à l'aide d'un essuie-tout. Une fois décortiqués, cuisez-les (7 mn environ).
Etape 2

Faites colorer le beurre dans une poêle, puis ajoutez les scampis. Ajoutez l'éclat d'ail pressé et le poivre. Ajoutez la crème fraîche et le concentré de tomate. Mélangez le tout.
Etape 3

Servez les scampis avec du pain à l'ail ou des pâtes.", preparation_time: 10, cooking_time: 7, price_indicator: 5, recipe_category_id: 2, user_id:3)

Recipe.create!(name: "Gratin dauphinois" , description: "Etape 1

Préchauffer le four à 120°C (thermostat 4).
Etape 2

Eplucher et couper les pommes de terres en rondelles. 

Presser l'ail.
Etape 3

Napper le fond d'un plat à gratin de crème.
Etape 4

Alterner une couche de pommes de terres, crème, ail, sel, poivre,
Etape 5

jusqu'à épuisement des ingrédients.
Etape 6

Terminer en nappant de crème, sel, poivre.
Etape 7

Mettre au four pendant au moins une heure. 

Plus la température est basse et le temps de cuisson long, plus les pommes seront fondantes...", preparation_time: 30, cooking_time: 60, price_indicator: 1, recipe_category_id: 1, user_id:4)

Recipe.create!(name: "Tagliatelles au gorgonzola" , description: "Etape 1

Faire revenir dans une noix de beurre les courgettes émincées et l'oignon dans une poêle, saler, poivrer et faire cuire pendant 5 minutes.
Etape 2

Ajouter le Gorgonzola coupé en morceaux puis mélanger sur feu doux.
Etape 3

Faire cuire les pâtes et les recouvrir de la préparation obtenue.", preparation_time: 10, cooking_time: 7, price_indicator: 1, recipe_category_id: 1, user_id:3)

Recipe.create!(name: "Lasagnes à l'italienne" , description: "Etape 1

Faites revenir 2 minutes à feu moyen le haché de Veau Tendriade.
Etape 2

Dans un bol, mélangez le coulis de tomates et la ricotta. Salez et poivrez.
Etape 3

Versez un filet d’huile d’olive dans le fond d’un plat à gratin. Déposez une couche de pâte, puis ajouter successivement une couche de haché de veau, une couche de coulis, et une couche d’origan et basilic ciselé. Recommencez l’opération en terminant par le coulis.
Etape 4

Ajoutez du parmesan et de l’emmental râpé pour gratiner. Passer au four à 240°C (Thermostat 8) pendant environ 20 min.", preparation_time: 15, cooking_time: 25, price_indicator: 1, recipe_category_id: 2, user_id:3)


puts "Recipe created"

3.times do |i|
	MenuRecipe.create!(menu_id: 1, recipe_id:i+1)
end

Ingredient.create!(name: "Carotte", calories: rand(50..250), ingredient_category_id: rand(1..5), unit: "unité(s)")
Ingredient.create!(name: "Patate", calories: rand(50..250), ingredient_category_id: rand(1..5), unit: "unité(s)")
Ingredient.create!(name: "Scampis", calories: rand(50..250), ingredient_category_id: rand(1..5), unit: "unité(s)")
Ingredient.create!(name: "Crème", calories: rand(50..250), ingredient_category_id: rand(1..5), unit: "cl")
Ingredient.create!(name: "Tomate", calories: rand(50..250), ingredient_category_id: rand(1..5), unit: "unité(s)")
Ingredient.create!(name: "Beurre", calories: rand(50..250), ingredient_category_id: rand(1..5), unit: "gr")
Ingredient.create!(name: "Ail", calories: rand(50..250), ingredient_category_id: rand(1..5), unit: "gousses")
Ingredient.create!(name: "Persil", calories: rand(50..250), ingredient_category_id: rand(1..5), unit: "gr")
Ingredient.create!(name: "Gorgonzola", calories: rand(50..250), ingredient_category_id: rand(1..5), unit: "gr")
Ingredient.create!(name: "Tagliatelle", calories: rand(50..250), ingredient_category_id: rand(1..5), unit: "gr")
Ingredient.create!(name: "Courgette", calories: rand(50..250), ingredient_category_id: rand(1..5), unit: "unité(s)")
Ingredient.create!(name: "Oignon", calories: rand(50..250), ingredient_category_id: rand(1..5), unit: "unité(s)")
Ingredient.create!(name: "Tofu", calories: rand(50..250), ingredient_category_id: rand(1..5), unit: "gr")
Ingredient.create!(name: "Riz", calories: rand(50..250), ingredient_category_id: rand(1..5), unit: "gr")
Ingredient.create!(name: "Echalote", calories: rand(50..250), ingredient_category_id: rand(1..5), unit: "unité(s)")
Ingredient.create!(name: "Sauce soja", calories: rand(50..250), ingredient_category_id: rand(1..5), unit: "cl")
Ingredient.create!(name: "Aubergine", calories: rand(50..250), ingredient_category_id: rand(1..5), unit: "unité(s)")
Ingredient.create!(name: "Poivron", calories: rand(50..250), ingredient_category_id: rand(1..5), unit: "unité(s)")
Ingredient.create!(name: "Thym", calories: rand(50..250), ingredient_category_id: rand(1..5), unit: "feuille(s)")
Ingredient.create!(name: "Laurier", calories: rand(50..250), ingredient_category_id: rand(1..5), unit: "feuille(s)")
Ingredient.create!(name: "Viande hachée", calories: rand(50..250), ingredient_category_id: rand(1..5), unit: "gr")
Ingredient.create!(name: "Pâte à lasagne", calories: rand(50..250), ingredient_category_id: rand(1..5), unit: "unité(s)")
Ingredient.create!(name: "Ricotta", calories: rand(50..250), ingredient_category_id: rand(1..5), unit: "gr")
Ingredient.create!(name: "Origan", calories: rand(50..250), ingredient_category_id: rand(1..5), unit: "gr")
Ingredient.create!(name: "Basilic", calories: rand(50..250), ingredient_category_id: rand(1..5), unit: "feuille(s)")
Ingredient.create!(name: "Parmesan", calories: rand(50..250), ingredient_category_id: rand(1..5), unit: "gr")
Ingredient.create!(name: "Gruyère", calories: rand(50..250), ingredient_category_id: rand(1..5), unit: "gr")

puts "Ingredients created"

5.times do |i|
  Composition.create(recipe_id: 1, ingredient_id: i+1, quantity: 2)
  Composition.create(recipe_id: 2, ingredient_id: i+1, quantity: 3)
end

puts "Composition created"

Comment.create(recipe_id: 1, description: "Super ! J'adore cette recette :)", user_id: 1)
puts "Comment created"

Like.create(recipe_id: 1, user_id: 1)
puts "Like created"
