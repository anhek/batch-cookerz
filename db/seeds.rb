# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ingredient_categories = ["Viande", "Poisson", "Légume", "Fruit", "Légumineuse"]




User.create!(first_name: "Admin", last_name: "Perfect Batch Cooker", email: "admin@batchcooker.fr", password: "admin123", nickname: "Admin", is_admin: true)
User.create!(first_name: "Maïté", last_name: "Ordonez", email: "maite@thp.org", password: "jaifaim", nickname: "Super Maïté")

4.times do |i|
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
Etape 2

Rajouter ensuite la julienne de légumes.
Etape 3

Bien mélanger.
Etape 4

Laisser mijoter 5 min.
Etape 5

Quand le riz est cuit, incorporez le dans la poêle et assaisonnez de sel et poivre.
Etape 6

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

Servez les scampis avec du pain à l'ail ou des pâtes.", preparation_time: 10, cooking_time: 7, price_indicator: 5, recipe_category_id: 1, user_id:3)
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

Plus la température est basse et le temps de cuisson long, plus les pommes seront fondantes...", preparation_time: 30, cooking_time: 60, price_indicator: 1, recipe_category_id: 2, user_id:4)

Recipe.create!(name: "Tagliatelles au gorgonzola" , description: "Etape 1

Faire revenir dans une noix de beurre les courgettes émincées et l'oignon dans une poêle, saler, poivrer et faire cuire pendant 5 minutes.
Etape 2

Ajouter le Gorgonzola coupé en morceaux puis mélanger sur feu doux.
Etape 3

Faire cuire les pâtes et les recouvrir de la préparation obtenue.", preparation_time: 10, cooking_time: 7, price_indicator: 1, recipe_category_id: 2, user_id:3)

Recipe.create!(name: "Lasagnes à l'italienne" , description: "Etape 1

Faites revenir 2 minutes à feu moyen le haché de Veau Tendriade.
Etape 2

Dans un bol, mélangez le coulis de tomates et la ricotta. Salez et poivrez.
Etape 3

Versez un filet d’huile d’olive dans le fond d’un plat à gratin. Déposez une couche de pâte, puis ajouter successivement une couche de haché de veau, une couche de coulis, et une couche d’origan et basilic ciselé. Recommencez l’opération en terminant par le coulis.
Etape 4

Ajoutez du parmesan et de l’emmental râpé pour gratiner. Passer au four à 240°C (Thermostat 8) pendant environ 20 min.", preparation_time: 15, cooking_time: 25, price_indicator: 1, recipe_category_id: 1, user_id:3)


puts "Recipe created"

Recipe.create!(name: "lasagnes au tofu" , description: "Etape 1

Faites revenir dans une poêle huilée les oignons et les champignons coupés en lamelles. Ajoutez les tomates pelées et copées en morceaux, le tofu émietté et l'ail haché.
Etape 2

Ajoutez les herbes de Provence, la muscade, la sauce de soja et le poivre. Laissez mijoter 20 minutes.Etape 3
Etape 3

Préparez la sauce béchamel. Dans un plat à four rectangulaire huilé, disposez un fond de béchamel puis une couche de 3 lasages, recouvrez avec la moitié du mélange tofu + légumes et une couche de béchamel.
Etape 4

Disposez une deuxième couche de lasagnes, les reste du mélange tofu + légumes, les dernières lasagnes et recouvrir de béchamel. Parsemez de parmesan.
Etape 5

Cuisez à four chaud 30 minutes (200°C/thermostat 6-7).", preparation_time: 45, cooking_time: 50, price_indicator: 2, recipe_category_id: 2, user_id:3)


Recipe.create!(name: "Pizza aux champignons" , description: "Etape 1

Etalez votre pâte à pizza dans une plaque.
Etape 2

Etalez de la sauce tomate sur toute la surface de la pâte.
Etape 3

Coupez les deux tranches de jambon en deux. Disposez-les sur la sauce tomate.
Etape 4

Faites revenir les champignons avec le demi oignon dans une poêle beurrée.
Etape 5

Ajoutez la crème liquide dans la préparation.
Etape 6

Mélangez le tout. Répartissez équitablement la préparation sur le jambon.

Etape 7
Ajoutez une bonne couche de gruyère râpé.

Etape 8
Saupoudrez la pizza d'origan. Mettez la au four pendant 10 mn, à thermostat 6.", preparation_time: 10, cooking_time: 15, price_indicator: 2, recipe_category_id: 1, user_id:3)

Recipe.create!(name: "Polenta à la mozzarella" , description: "Etape 1

Porter l'eau et le lait à ébullition avec les cubes de bouillon de légumes.
Etape 2

Ajouter la polenta, le safran et la muscade, faire cuire à petit feu en remuant de temps en temps.
Etape 3

Ajouter le beurre, le fromage rapé et la mozzarella coupée en petits dés. Mélanger, verser dans un plat à gratin prélablement beurré.
Etape 4

Parsemer de 2 à 3 cuillères à soupe de fromage râpé.
Etape 5

Cuire 20 min au four préchauffé à 220°C.", preparation_time: 20, cooking_time: 20, price_indicator: 2, recipe_category_id: 2, user_id:3)

Recipe.create!(name: "Tagliatelles aux courgettes" , description: "Etape 1

Cuire les tagliatelles al dente.
Etape 2

Pendant la préparation des pâtes, éplucher les courgettes puis avec l'économe, prélever des bandes de courgettes en forme de tagliatelles.
Etape 3

Emincer l'oignon finement et presser l'ail.
Etape 4

Ciseler les 6 feuilles de basilic.
Etape 5

Faire chauffer l'huile d'olive dans une poêle et verser les courgettes, les tomates, l'oignon et l'ail.
Etape 6

Ajouter le basilic, le sel et le poivre.
Etape 7

Laisser chauffer sur feu moyen une dizaine de minutes en mélangeant.
Etape 8

Une fois les pâtes égouttées, y mélanger les légumes et la crème.
Etape 9

Laisser chauffer à feu très doux quelques minutes.", preparation_time: 10, cooking_time: 10, price_indicator: 2, recipe_category_id: 2, user_id:3)

Recipe.create!(name: "Wok de nouilles chinoises au tofu" , description: "Etape 1

La Marinade du tofu : dans un plat creux, mettre 6 à 8 cuillères à soupe de sauce de soja. Hacher un morceau de gingembre puis éplucher et hacher l’ail, les ajouter dans la sauce de soja. Ciseler 3 oignons verts et les ajouter à la marinade, puis poivrer. Couper le tofu en dés, le mettre dans la marinade, ajouter 2 cuillères à soupe de miel, bien mélanger. Laisser reposer pendant 2 heures.
Etape 2

La Marinade des légumes : Laver et couper les poivrons , l’oignon et le piment vert. Les ciseler en fines lanières, puis les mettre à mariner dans 4 cuillères à soupe d’huile d’olive et 2 cuillères à soupe de soja, et un peu de poivre.
Etape 3

La cuisson : Dans un wok, faire sauter les poivrons, oignon et piment, jusqu’à ce qu’ils soient juste dorés. Les retirer du wok et les réserver. Dans une grande casserole, porter à ébullition un grand volume d’eau, puis y jeter la moitié des nouilles chinoises. Faire cuire pendant 2 minutes puis les égoutter.
Etape 4

Faire sauter le tofu dans un wok avec un peu d’huile chaude. Il faut que le tofu soir bien doré. Rajouter les légumes, puis les nouilles. Faire sauter le tout, en ajoutant le reste de la marinade du tofu, pendant 5 à 6 minutes.", preparation_time: 15, cooking_time: 15, price_indicator: 2, recipe_category_id: 3, user_id:3)

Recipe.create!(name: "Poulet aux olives" , description: "Etape 1

Faire revenir tous les morceaux de poulet, avec l'huile d'olive et la margarine. Il faut que ces morceaux soient bien dorés de toutes parts.
Etape 2

Pendant ce temps, rincer et faire égoutter dans une passoire, les olives et les câpres.
Etape 3

Eplucher les champignons, et les couper en lamelles (pas trop fines).
Etape 4

Peler les oignons et l'ail.
Etape 5

Couper en lamelles pour les premiers, et en quatre pour les seconds (ôter le germe central de l'ail, cela facilite la digestion).
Etape 6

Les jeter dans la cocotte où se trouve le poulet. Laisser 5 min, en tournant pour bien incorporer.
Etape 7

Ajouter les olives, les câpres, les champignons et le bouquet garni.
Etape 8

Bien mélanger le tout. Saler et poivrer.
Etape 9

Recouvrir la cocotte d'un couvercle, mais laisser un petit espace d'air.
Etape 10
Laisser sur feu très doux, pendant 30 à 35 min, en venant régulièrement soulever (délicatement), le poulet et ses ingrédients.", preparation_time: 20, cooking_time: 30, price_indicator: 2, recipe_category_id: 1, user_id:3)

Recipe.create!(name: "Croquettes de carottes" , description: "Etape 1

Pelez les carottes et râpez-les. Coupez le 1/2 poivron en petits dés.
Etape 2

Dans une sauteuse, faites revenir les carottes, les dés de poivrons et l'ail émincé. Quand le mélange est fondant (environ 10 min de cuisson à feu doux), versez-le dans un saladier.
Etape 3

Ajoutez les oeufs, le persil haché, la farine, salez et poivrez et mélangez.
Etape 4

Avec deux cuillères à soupe, faites des petites boules du mélange et faites-les frire quelques instants de chaque côté dans une une huile bien chaude.", preparation_time: 10, cooking_time: 3, price_indicator: 1, recipe_category_id: 3, user_id:3)

Recipe.create!(name: "Omelettes aux carottes" , description: "Etape 1

Râper les carottes et l'oignon, les mélanger aux oeufs battus, poivrer, saler puis ajouter les herbes ciselés.
Etape 2

Etaler le mélange dans une poêle anti-adhésive, la couche doit être assez fine.
Etape 3

Laisser cuire à couvert et à feu moyen 5 minutes sur chaque face (cela ne doit pas être baveux ).
Etape 4

Faire glisser sur un plat, étaler en couche épaisse le fromage frais et plier l'omelette en 2.", preparation_time: 5, cooking_time: 10, price_indicator: 1, recipe_category_id: 2, user_id:3)

Recipe.create!(name: "Poulet aux carottes" , description: "Etape 1

Faire revenir l'oignon émincé dans 1 cuillère à soupe d'huile d'olive.
Etape 2

Ajouter le poulet émincé.
Etape 3

Attendre que tous les morceaux de poulet soient blancs.
Etape 4

Ajouter les carottes émincées en rondelles.
Etape 5

Saler, poivrer et ajouter 1 cuillère à café de curry (selon gout) ou plus.
Etape 6

Ajouter le miel.
Etape 7

Laisser cuire jusqu'à ce que la viande soit caramélisé
Etape 8

Ajouter de la crème.
Etape 9

Ajouter sel et poivre si besoin.
Etape 10

Attendre 2 min.", preparation_time: 20, cooking_time: 25, price_indicator: 3, recipe_category_id: 1, user_id:3)

Recipe.create!(name: "Riz aux carottes, courgettes et tomates" , description: "Etape 1

Coupez les carottes et les courgettes à la verticale de façon à avoir des ronds de carottes et des courgettes assez fines. Coupez les tomates en petits morceaux.
Etape 2

Dans une casserole, faites chauffer un peu d’huile d’olive puis ajoutez les carottes et un peu d’eau, sans recouvrir les carottes.
Etape 3

Quand les carottes se ramollissent légèrement, ajoutez les courgettes, le basilic, la sauge et le sel. Ajoutez un peu d’eau de façon à ce que les légumes ne brulent pas et se ramollissent plus vite.
Etape 4

Quand l’eau commence à bouillir, ajoutez un peu de lait sans baisser la plaque. Ajoutez deux bonnes pincées de sucre et saupoudrez de sel.
Etape 5

Quand les courgettes et les carottes sont cuites, ajoutez les tomates et mélangez souvent de façon à ce que le lait prenne un belle couleur.
Etape 6

A côte de cela faire cuire une bonne quantité de riz.
Etape 7

Une fois ce dernier cuit, égouttez-le et ajoutez-le dans la casserole. Bien mélangez et ajoutez un peu de sel. Le riz doit s’imprégner du bouillon.
Etape 8

A ce moment là, goutez et corrigez si nécessaire avec un peu de sel.", preparation_time: 10, cooking_time: 20, price_indicator: 1, recipe_category_id: 2, user_id:3)


3.times do |i|
	MenuRecipe.create!(menu_id: 1, recipe_id:i+1)
end

Ingredient.create!(name: "Ail", calories: rand(50..250), ingredient_category_id: rand(1..5), unit: "gousses")
Ingredient.create!(name: "Amande", calories: rand(50..250), ingredient_category_id: rand(1..5), unit: "gr")
Ingredient.create!(name: "Aubergine", calories: rand(50..250), ingredient_category_id: rand(1..5), unit: "unité(s)")

Ingredient.create!(name: "Basilic", calories: rand(50..250), ingredient_category_id: rand(1..5), unit: "feuille(s)")
Ingredient.create!(name: "Béchamelle", calories: rand(50..250), ingredient_category_id: rand(1..5), unit: "gr")
Ingredient.create!(name: "Beurre", calories: rand(50..250), ingredient_category_id: rand(1..5), unit: "gr")
Ingredient.create!(name: "Bûche de chèvre", calories: rand(50..250), ingredient_category_id: rand(1..5), unit: "gr")

Ingredient.create!(name: "Câpres", calories: rand(50..250), ingredient_category_id: rand(1..5), unit: "gr")
Ingredient.create!(name: "Carotte", calories: rand(50..250), ingredient_category_id: rand(1..5), unit: "unité(s)")
Ingredient.create!(name: "Champignon", calories: rand(50..250), ingredient_category_id: rand(1..5), unit: "gr")
Ingredient.create!(name: "Coriandre", calories: rand(50..250), ingredient_category_id: rand(1..5), unit: "pincée(s)")
Ingredient.create!(name: "Coulis de tomate", calories: rand(50..250), ingredient_category_id: rand(1..5), unit: "gr")
Ingredient.create!(name: "Courgette", calories: rand(50..250), ingredient_category_id: rand(1..5), unit: "unité(s)")
Ingredient.create!(name: "Crème fraiche", calories: rand(50..250), ingredient_category_id: rand(1..5), unit: "gr")
Ingredient.create!(name: "Crème liquide", calories: rand(50..250), ingredient_category_id: rand(1..5), unit: "cl")
Ingredient.create!(name: "Cube de bouillon", calories: rand(50..250), ingredient_category_id: rand(1..5), unit: "unité(s)")
Ingredient.create!(name: "Curry", calories: rand(50..250), ingredient_category_id: rand(1..5), unit: "pincée(s)")

Ingredient.create!(name: "Eau", calories: rand(50..250), ingredient_category_id: rand(1..5), unit: "cl")
Ingredient.create!(name: "Echalote", calories: rand(50..250), ingredient_category_id: rand(1..5), unit: "unité(s)")
Ingredient.create!(name: "Escalope de poulet", calories: rand(50..250), ingredient_category_id: rand(1..5), unit: "unité(s)")
Ingredient.create!(name: "Endive", calories: rand(50..250), ingredient_category_id: rand(1..5), unit: "unité(s)")

Ingredient.create!(name: "Farine", calories: rand(50..250), ingredient_category_id: rand(1..5), unit: "gr")
Ingredient.create!(name: "Fromage frais", calories: rand(50..250), ingredient_category_id: rand(1..5), unit: "gr")

Ingredient.create!(name: "Gorgonzola", calories: rand(50..250), ingredient_category_id: rand(1..5), unit: "gr")
Ingredient.create!(name: "Gruyère", calories: rand(50..250), ingredient_category_id: rand(1..5), unit: "gr")

Ingredient.create!(name: "Herbes de Provence", calories: rand(50..250), ingredient_category_id: rand(1..5), unit: "pincée(s)")
Ingredient.create!(name: "Huile d'olive", calories: rand(50..250), ingredient_category_id: rand(1..5), unit: "cl")

Ingredient.create!(name: "Jambon", calories: rand(50..250), ingredient_category_id: rand(1..5), unit: "unité(s)")
Ingredient.create!(name: "Julienne de légumes", calories: rand(50..250), ingredient_category_id: rand(1..5), unit: "gr")

Ingredient.create!(name: "Lait", calories: rand(50..250), ingredient_category_id: rand(1..5), unit: "cl")
Ingredient.create!(name: "Laurier", calories: rand(50..250), ingredient_category_id: rand(1..5), unit: "feuille(s)")
Ingredient.create!(name: "Levure chimique", calories: rand(50..250), ingredient_category_id: rand(1..5), unit: "unité(s)")

Ingredient.create!(name: "Margarine", calories: rand(50..250), ingredient_category_id: rand(1..5), unit: "gr")
Ingredient.create!(name: "Menthe", calories: rand(50..250), ingredient_category_id: rand(1..5), unit: "feuille(s)")
Ingredient.create!(name: "Miel", calories: rand(50..250), ingredient_category_id: rand(1..5), unit: "cl")
Ingredient.create!(name: "Mozarella", calories: rand(50..250), ingredient_category_id: rand(1..5), unit: "unité(s)")
Ingredient.create!(name: "Muscade", calories: rand(50..250), ingredient_category_id: rand(1..5), unit: "pincée(s)")

Ingredient.create!(name: "Oeuf", calories: rand(50..250), ingredient_category_id: rand(1..5), unit: "unité(s)")
Ingredient.create!(name: "Oignon", calories: rand(50..250), ingredient_category_id: rand(1..5), unit: "unité(s)")
Ingredient.create!(name: "Olive verte", calories: rand(50..250), ingredient_category_id: rand(1..5), unit: "gr")
Ingredient.create!(name: "Origan", calories: rand(50..250), ingredient_category_id: rand(1..5), unit: "gr")

Ingredient.create!(name: "Parmesan", calories: rand(50..250), ingredient_category_id: rand(1..5), unit: "gr")
Ingredient.create!(name: "Patate", calories: rand(50..250), ingredient_category_id: rand(1..5), unit: "unité(s)")
Ingredient.create!(name: "Pâte à lasagne", calories: rand(50..250), ingredient_category_id: rand(1..5), unit: "unité(s)")
Ingredient.create!(name: "Pâte à pizza", calories: rand(50..250), ingredient_category_id: rand(1..5), unit: "gr")
Ingredient.create!(name: "Persil", calories: rand(50..250), ingredient_category_id: rand(1..5), unit: "gr")
Ingredient.create!(name: "Piment vert", calories: rand(50..250), ingredient_category_id: rand(1..5), unit: "unité(s)")
Ingredient.create!(name: "Polenta", calories: rand(50..250), ingredient_category_id: rand(1..5), unit: "gr")
Ingredient.create!(name: "Poivron", calories: rand(50..250), ingredient_category_id: rand(1..5), unit: "unité(s)")
Ingredient.create!(name: "Poulet", calories: rand(50..250), ingredient_category_id: rand(1..5), unit: "cuisse(s)")
Ingredient.create!(name: "Pousse de soja", calories: rand(50..250), ingredient_category_id: rand(1..5), unit: "gr")

Ingredient.create!(name: "Ricotta", calories: rand(50..250), ingredient_category_id: rand(1..5), unit: "gr")
Ingredient.create!(name: "Riz", calories: rand(50..250), ingredient_category_id: rand(1..5), unit: "gr")
Ingredient.create!(name: "Roquefort", calories: rand(50..250), ingredient_category_id: rand(1..5), unit: "gr")

Ingredient.create!(name: "Sauce soja", calories: rand(50..250), ingredient_category_id: rand(1..5), unit: "cl")
Ingredient.create!(name: "Sel", calories: rand(50..250), ingredient_category_id: rand(1..5), unit: "pincée(s)")
Ingredient.create!(name: "Scampis", calories: rand(50..250), ingredient_category_id: rand(1..5), unit: "unité(s)")

Ingredient.create!(name: "Tagliatelle", calories: rand(50..250), ingredient_category_id: rand(1..5), unit: "gr")
Ingredient.create!(name: "Thym", calories: rand(50..250), ingredient_category_id: rand(1..5), unit: "feuille(s)")
Ingredient.create!(name: "Tofu", calories: rand(50..250), ingredient_category_id: rand(1..5), unit: "gr")
Ingredient.create!(name: "Tomate", calories: rand(50..250), ingredient_category_id: rand(1..5), unit: "unité(s)")
Ingredient.create!(name: "Tomate cerise", calories: rand(50..250), ingredient_category_id: rand(1..5), unit: "unité(s)")
Ingredient.create!(name: "Tomate concentrée", calories: rand(50..250), ingredient_category_id: rand(1..5), unit: "cl")

Ingredient.create!(name: "Viande hachée", calories: rand(50..250), ingredient_category_id: rand(1..5), unit: "gr")

puts "Ingredients created"

1.times do |i|
  Composition.create(recipe_id: 1, ingredient_id: 60, quantity: 100)
  Composition.create(recipe_id: 1, ingredient_id: 29, quantity: 125)
  Composition.create(recipe_id: 1, ingredient_id: 53, quantity: 50)
  Composition.create(recipe_id: 1, ingredient_id: 19, quantity: 1)
  Composition.create(recipe_id: 1, ingredient_id: 55, quantity: 1)
  Composition.create(recipe_id: 1, ingredient_id: 56, quantity: 1)
  Composition.create(recipe_id: 1, ingredient_id: 27, quantity: 1/2)
end

puts "Composition poelee au tofu created"

1.times do |i|
  Composition.create(recipe_id: 2, ingredient_id: 3, quantity: 90)
  Composition.create(recipe_id: 2, ingredient_id: 13, quantity: 90)
  Composition.create(recipe_id: 2, ingredient_id: 49, quantity: 90)
  Composition.create(recipe_id: 2, ingredient_id: 39, quantity: 90)
  Composition.create(recipe_id: 2, ingredient_id: 61, quantity:125)
  Composition.create(recipe_id: 2, ingredient_id: 6, quantity: 1/2)
  Composition.create(recipe_id: 2, ingredient_id: 27, quantity: 1)
  Composition.create(recipe_id: 2, ingredient_id: 59, quantity: 1)
  Composition.create(recipe_id: 2, ingredient_id: 31, quantity: 1)
  Composition.create(recipe_id: 2, ingredient_id: 56, quantity: 1)
end

puts "Composition ratatouille created"

1.times do |i|
  Composition.create(recipe_id: 3, ingredient_id: 57, quantity: 6)
  Composition.create(recipe_id: 3, ingredient_id: 15, quantity: 65)
  Composition.create(recipe_id: 3, ingredient_id: 63, quantity: 2)
  Composition.create(recipe_id: 3, ingredient_id: 6, quantity: 1)
  Composition.create(recipe_id: 3, ingredient_id: 1, quantity: 1/4)
  Composition.create(recipe_id: 3, ingredient_id: 56, quantity: 1)
  Composition.create(recipe_id: 3, ingredient_id: 46, quantity: 1)
end
puts "Composition scampis created"

1.times do |i|
  Composition.create(recipe_id: 4, ingredient_id: 43, quantity: 200)
  Composition.create(recipe_id: 4, ingredient_id: 1, quantity: 200)
  Composition.create(recipe_id: 4, ingredient_id: 14, quantity: 1/2)
  Composition.create(recipe_id: 4, ingredient_id: 56, quantity: 1)
end
puts "Composition gratin dauphinois created"

1.times do |i|
  Composition.create(recipe_id: 5, ingredient_id: 24, quantity: 62)
  Composition.create(recipe_id: 5, ingredient_id: 58, quantity: 100)
  Composition.create(recipe_id: 5, ingredient_id: 13, quantity: 75)
  Composition.create(recipe_id: 5, ingredient_id: 39, quantity: 1/4)
  Composition.create(recipe_id: 5, ingredient_id: 6, quantity: 1)
  Composition.create(recipe_id: 5, ingredient_id: 56, quantity: 1)
end
puts "Composition tagliatelles au gorgonzola created"

1.times do |i|
  Composition.create(recipe_id: 6, ingredient_id: 64, quantity: 100)
  Composition.create(recipe_id: 6, ingredient_id: 45, quantity: 4)
  Composition.create(recipe_id: 6, ingredient_id: 12, quantity: 50)
  Composition.create(recipe_id: 6, ingredient_id: 52, quantity: 62)
  Composition.create(recipe_id: 6, ingredient_id: 41, quantity: 1)
  Composition.create(recipe_id: 6, ingredient_id: 4, quantity: 1)
  Composition.create(recipe_id: 6, ingredient_id: 42, quantity: 15)
  Composition.create(recipe_id: 6, ingredient_id: 25, quantity: 15)
  Composition.create(recipe_id: 6, ingredient_id: 27, quantity: 1)
  Composition.create(recipe_id: 6, ingredient_id: 56, quantity: 1)
end
puts "Composition lasagnes created"

1.times do |i|
  Composition.create(recipe_id: 7, ingredient_id: 60, quantity: 125)
  Composition.create(recipe_id: 7, ingredient_id: 44, quantity: 4)
  Composition.create(recipe_id: 7, ingredient_id: 10, quantity: 75)
  Composition.create(recipe_id: 7, ingredient_id: 61, quantity: 200)
  Composition.create(recipe_id: 7, ingredient_id: 39, quantity: 1)
  Composition.create(recipe_id: 7, ingredient_id: 1, quantity: 1/2)
  Composition.create(recipe_id: 7, ingredient_id: 5, quantity: 300)
  Composition.create(recipe_id: 7, ingredient_id: 27, quantity: 1)
  Composition.create(recipe_id: 7, ingredient_id: 26, quantity: 1)
  Composition.create(recipe_id: 7, ingredient_id: 37, quantity: 1)
  Composition.create(recipe_id: 7, ingredient_id: 51, quantity: 30)
end
puts "Composition lasagnes tofu created"

1.times do |i|
  Composition.create(recipe_id: 8, ingredient_id: 45, quantity: 130)
  Composition.create(recipe_id: 8, ingredient_id: 23, quantity: 45)
  Composition.create(recipe_id: 8, ingredient_id: 12, quantity: 50)
  Composition.create(recipe_id: 8, ingredient_id: 54, quantity: 35)
  Composition.create(recipe_id: 8, ingredient_id: 36, quantity: 1/2)
  Composition.create(recipe_id: 8, ingredient_id: 25, quantity: 50)
  Composition.create(recipe_id: 8, ingredient_id: 56, quantity: 1)
end
puts "Composition pizza aux champignons created"

1.times do |i|
  Composition.create(recipe_id: 9, ingredient_id: 18, quantity: 80)
  Composition.create(recipe_id: 9, ingredient_id: 30, quantity: 80)
  Composition.create(recipe_id: 9, ingredient_id: 16, quantity: 1/2)
  Composition.create(recipe_id: 9, ingredient_id: 48, quantity: 50)
  Composition.create(recipe_id: 9, ingredient_id: 37, quantity: 1)
  Composition.create(recipe_id: 9, ingredient_id: 6, quantity: 13)
  Composition.create(recipe_id: 9, ingredient_id: 25, quantity: 13)
  Composition.create(recipe_id: 9, ingredient_id: 36, quantity: 1/2)
end
puts "Composition polenta a la mozarella created"

1.times do |i|
  Composition.create(recipe_id: 10, ingredient_id: 58, quantity: 100)
  Composition.create(recipe_id: 10, ingredient_id: 13, quantity: 1)
  Composition.create(recipe_id: 10, ingredient_id: 62, quantity: 3)
  Composition.create(recipe_id: 10, ingredient_id: 15, quantity: 5)
  Composition.create(recipe_id: 10, ingredient_id: 39, quantity: 1/4)
  Composition.create(recipe_id: 10, ingredient_id: 1, quantity: 1)
  Composition.create(recipe_id: 10, ingredient_id: 4, quantity: 2)
  Composition.create(recipe_id: 10, ingredient_id: 42, quantity: 25)
  Composition.create(recipe_id: 10, ingredient_id: 27, quantity: 1)
  Composition.create(recipe_id: 10, ingredient_id: 56, quantity: 1)
end
puts "Composition tagliatelles created"

1.times do |i|
  Composition.create(recipe_id: 11, ingredient_id: 60, quantity: 100)
  Composition.create(recipe_id: 11, ingredient_id: 49, quantity: 1)
  Composition.create(recipe_id: 11, ingredient_id: 47, quantity: 1/2)
  Composition.create(recipe_id: 11, ingredient_id: 39, quantity: 1/2)
  Composition.create(recipe_id: 11, ingredient_id: 19, quantity: 1)
  Composition.create(recipe_id: 11, ingredient_id: 11, quantity: 3)
  Composition.create(recipe_id: 11, ingredient_id: 1, quantity: 1)
  Composition.create(recipe_id: 11, ingredient_id: 2, quantity: 15)
  Composition.create(recipe_id: 11, ingredient_id: 55, quantity: 1)
  Composition.create(recipe_id: 11, ingredient_id: 35, quantity: 1)
end
puts "Composition wok tofu created"

1.times do |i|
  Composition.create(recipe_id: 12, ingredient_id: 50, quantity: 1)
  Composition.create(recipe_id: 12, ingredient_id: 39, quantity: 1/3)
  Composition.create(recipe_id: 12, ingredient_id: 1, quantity: 1)
  Composition.create(recipe_id: 12, ingredient_id: 8, quantity: 25)
  Composition.create(recipe_id: 12, ingredient_id: 40, quantity: 40)
  Composition.create(recipe_id: 12, ingredient_id: 10, quantity: 50)
  Composition.create(recipe_id: 12, ingredient_id: 27, quantity: 20)
  Composition.create(recipe_id: 12, ingredient_id: 33, quantity: 8)
  Composition.create(recipe_id: 12, ingredient_id: 31, quantity: 2)
  Composition.create(recipe_id: 12, ingredient_id: 59, quantity: 2)
  Composition.create(recipe_id: 12, ingredient_id: 56, quantity: 1)
end
puts "Composition poulet aux olives created"

1.times do |i|
  Composition.create(recipe_id: 13, ingredient_id: 9, quantity: 3)
  Composition.create(recipe_id: 13, ingredient_id: 49, quantity: 1/4)
  Composition.create(recipe_id: 13, ingredient_id: 22, quantity: 3)
  Composition.create(recipe_id: 13, ingredient_id: 46, quantity: 1)
  Composition.create(recipe_id: 13, ingredient_id: 1, quantity: 1/2)
end
puts "Composition croquettes carottes created"

1.times do |i|
  Composition.create(recipe_id: 16, ingredient_id: 38, quantity: 1)
  Composition.create(recipe_id: 16, ingredient_id: 9, quantity: 1)
  Composition.create(recipe_id: 16, ingredient_id: 39, quantity: 1/4)
  Composition.create(recipe_id: 16, ingredient_id: 34, quantity: 1)
  Composition.create(recipe_id: 16, ingredient_id: 4, quantity: 1)
  Composition.create(recipe_id: 16, ingredient_id: 23, quantity: 50)
end
puts "Composition omelettes carottes created"

1.times do |i|
  Composition.create(recipe_id: 14, ingredient_id: 50, quantity: 1)
  Composition.create(recipe_id: 14, ingredient_id: 9, quantity: 1)
  Composition.create(recipe_id: 14, ingredient_id: 35, quantity: 1)
  Composition.create(recipe_id: 14, ingredient_id: 39, quantity: 1/3)
  Composition.create(recipe_id: 14, ingredient_id: 14, quantity: 15)
  Composition.create(recipe_id: 14, ingredient_id: 56, quantity: 1)
  Composition.create(recipe_id: 14, ingredient_id: 17, quantity: 1)
  Composition.create(recipe_id: 14, ingredient_id: 27, quantity: 1)
end
puts "Composition poulet carottess created"

1.times do |i|
  Composition.create(recipe_id: 15, ingredient_id: 9, quantity: 1)
  Composition.create(recipe_id: 15, ingredient_id: 13, quantity: 1)
  Composition.create(recipe_id: 15, ingredient_id: 61, quantity: 1)
  Composition.create(recipe_id: 15, ingredient_id: 53, quantity: 100)
  Composition.create(recipe_id: 15, ingredient_id: 30, quantity: 3)
  Composition.create(recipe_id: 15, ingredient_id: 56, quantity: 1)
end
puts "Composition riz aux carottes created"

Comment.create(recipe_id: 2, description: "Super ! J'adore cette recette :)", user_id: 1)
puts "Comment created"

Like.create(recipe_id: 1, user_id: 1)
puts "Like created"

