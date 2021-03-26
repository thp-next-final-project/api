# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts " 
                *********************************
                *                               *
                *         BEGIN OF SEED         *
                *                               *
                ********************************* 
"

## /!\ A COMMENTER SI PUSH SUR GITHUB (HEROKU) /!\ ##
# User.destroy_all
# Meal.destroy_all
# Mod.destroy_all
# Ingredient.destroy_all
# MyEquipement.destroy_all
# Exercice.destroy_all


############################
##          USER          ##
############################ 
5.times do |i|
  User.create!(
    email: "user" + i.to_s + "@yopmail.com",
    password: "user" + i.to_s,
    firstname: Faker::Name.first_name,
    lastname: Faker::Name.last_name, 
    role: "user"
  )
end

puts "
        #{tp User.all}
---------------------------------------------------------------------
---------------------------------------------------------------------
        Creation Users... #{User.count}
        DONE
---------------------------------------------------------------------
---------------------------------------------------------------------
"

############################
##          MEAL          ##
############################ 

title = ["breakfast", "lunch", "dinner"]
sexe = ["man", "woman"]
objectif = ["slim", "build", "maintain"]
activity = ["sedentary", "active", "sporty"]


10.times do
  mods = Mod.create!(
    calorie: Faker::Number.number(digits: 4)
  )
end

@meals = []
20.times do
  @meals << Meal.create!(
    calorie: Faker::Number.number(digits: 3),
    name: Faker::Food.dish, 
    title: title[rand(0..2)]
  )
end

500.times do
  mesure = [0, 0, 0];
  i = rand(0..2)
  mesure[i] = rand(5..500)
  ingredients = Ingredient.create!(
    name: Faker::Food.ingredient, 
    cal_per_something: Faker::Number.number(digits: 2), 
    quantity: mesure[0], 
    weight: mesure[1],
    liter: mesure[2]
  )
end


50.times do
  JointureMeal.create!(
    mod_id: rand(1..Mod.all.length),
    meal_id: rand(1..Meal.all.length)
  )
end

puts "
---------------------------------------------------------------------
---------------------------------------------------------------------
        Creation JointureMeals... #{JointureMeal.count}
        DONE
---------------------------------------------------------------------
---------------------------------------------------------------------
"

3.times do 
  @meals.length.times do |i|
    JointureIngredient.create!(
      ingredient_id: rand(1..Ingredient.all.length),
      meal_id: i + 1
    )
  end
end 

puts "
---------------------------------------------------------------------
---------------------------------------------------------------------
        Creation JointureIngredients... #{JointureIngredient.count}
        DONE
---------------------------------------------------------------------
---------------------------------------------------------------------
"



############################
##         WORKOUT        ##
############################ 

categories_exercices = ["warm_up", "building", "skill", "workout"]
exercices = [
  {
    :name => "Montées de genous",
    :categorie => "warm_up",
    :description => "La flemme de faire des :descriptions tout de suite",
    :cal => 100
  },
  {
    :name => "Talons fesses",
    :categorie => "warm_up",
    :description => "La flemme de faire des :descriptions tout de suite",
    :cal => 100
  },
  {
    :name => "Simple Under",
    :categorie => "workout",
    :description => "La flemme de faire des :descriptions tout de suite",
    :cal => 100
  },
  {
    :name => "Simple Under",
    :categorie => "warm_up",
    :description => "La flemme de faire des :descriptions tout de suite",
    :cal => 100
  },
  {
    :name => "Double Under",
    :categorie => "workout",
    :description => "La flemme de faire des :descriptions tout de suite",
    :cal => 200
  },
  {
    :name => "Double Under",
    :categorie => "warm_up",
    :description => "La flemme de faire des :descriptions tout de suite",
    :cal => 200
  },
  {
    :name => "Pompe sur genous",
    :categorie => "workout",
    :description => "La flemme de faire des :descriptions tout de suite",
    :cal => 50
  },
  {
    :name => "Pompe basique",
    :categorie => "workout",
    :description => "La flemme de faire des :descriptions tout de suite",
    :cal => 100
  },
  {
    :name => "Pompe pieds surélevés",
    :categorie => "workout",
    :description => "La flemme de faire des :descriptions tout de suite",
    :cal => 150
  },
  {
    :name => "Curl Biceps",
    :categorie => "building",
    :description => "La flemme de faire des :descriptions tout de suite",
    :cal => 100
  },{
    :name => "Développé couché",
    :categorie => "building",
    :description => "La flemme de faire des :descriptions tout de suite",
    :cal => 100
  },
  {
    :name => "Squat",
    :categorie => "building",
    :description => "La flemme de faire des :descriptions tout de suite",
    :cal => 100
  },
  {
    :name => "Tirage dos poulie haute",
    :categorie => "building",
    :description => "La flemme de faire des :descriptions tout de suite",
    :cal => 100
  },
  {
    :name => "Élévation latérale haltères",
    :categorie => "building",
    :description => "La flemme de faire des :descriptions tout de suite",
    :cal => 100
  },
  {
    :name => "Poulie haute triceps",
    :categorie => "building",
    :description => "La flemme de faire des :descriptions tout de suite",
    :cal => 100
  },
  {
    :name => "Tirage horizontale",
    :categorie => "building",
    :description => "La flemme de faire des :descriptions tout de suite",
    :cal => 100
  },
  {
    :name => "Rowing dos",
    :categorie => "building",
    :description => "La flemme de faire des :descriptions tout de suite",
    :cal => 100
  },
  {
    :name => "Scieur",
    :categorie => "building",
    :description => "La flemme de faire des :descriptions tout de suite",
    :cal => 100
  },
  {
    :name => "Traction pronation",
    :categorie => "building",
    :description => "La flemme de faire des :descriptions tout de suite",
    :cal => 100
  },
  {
    :name => "Traction supination",
    :categorie => "building",
    :description => "La flemme de faire des :descriptions tout de suite",
    :cal => 100
  },
  {
    :name => "Traction pronation",
    :categorie => "skill",
    :description => "La flemme de faire des :descriptions tout de suite",
    :cal => 100
  },
  {
    :name => "Traction supination",
    :categorie => "skill",
    :description => "La flemme de faire des :descriptions tout de suite",
    :cal => 100
  },
  {
    :name => "Squat",
    :categorie => "skill",
    :description => "La flemme de faire des :descriptions tout de suite",
    :cal => 100
  },
  {
    :name => "HSPU",
    :categorie => "building",
    :description => "La flemme de faire des :descriptions tout de suite",
    :cal => 100
  },
  {
    :name => "HSPU",
    :categorie => "skill",
    :description => "La flemme de faire des :descriptions tout de suite",
    :cal => 100
  },
  {
    :name => "HSPU",
    :categorie => "workout",
    :description => "La flemme de faire des :descriptions tout de suite",
    :cal => 100
  },
  {
    :name => "Muscle Up",
    :categorie => "skill",
    :description => "La flemme de faire des :descriptions tout de suite",
    :cal => 100
  },
  {
    :name => "Muscle Up",
    :categorie => "workout",
    :description => "La flemme de faire des :descriptions tout de suite",
    :cal => 100
  },
  {
    :name => "Deadlift",
    :categorie => "skill",
    :description => "La flemme de faire des :descriptions tout de suite",
    :cal => 100
  },
  {
    :name => "Deadlift",
    :categorie => "workout",
    :description => "La flemme de faire des :descriptions tout de suite",
    :cal => 100
  },
  {
    :name => "Deadlift",
    :categorie => "building",
    :description => "La flemme de faire des :descriptions tout de suite",
    :cal => 100
  }
]
equipements = [
  {:name => "Poids de corps", :weight => 0},
  {:name => "Corde à Sauter", :weight => 0},
  {:name => "Barre de traction", :weight => 0},
  {:name => "Haltère", :weight => 2},
  {:name => "Haltère", :weight => 5},
  {:name => "Haltère", :weight => 10},
  {:name => "Haltère", :weight => 15},
  {:name => "Haltère", :weight => 20},
  {:name => "Haltère", :weight => 25},
  {:name => "Haltère", :weight => 30},
  {:name => "Élastique", :weight => 2},
  {:name => "Élastique", :weight => 4},
  {:name => "Élastique", :weight => 6},
  {:name => "Élastique", :weight => 8}
]

equipements.length.times do |i|
  Equipement.create!(
    name: equipements[i][:name],
    weight: equipements[i][:weight]
  )
end

puts "
---------------------------------------------------------------------
---------------------------------------------------------------------
        #{tp Equipement.all}
        Creation Equipements... #{Equipement.count}
        DONE
---------------------------------------------------------------------
---------------------------------------------------------------------
"

exercices.length.times do |i|
  Exercice.create!(
    name: exercices[i][:name],
    categorie: exercices[i][:categorie],
    cal: exercices[i][:cal],
    description: exercices[i][:description],
    equipement_id: rand(1..equipements.length)
  )
end

puts "
---------------------------------------------------------------------
---------------------------------------------------------------------
        #{tp Exercice.all}
        Creation Exercices... #{Exercice.count}
        DONE
---------------------------------------------------------------------
---------------------------------------------------------------------
"


User.all.length.times do |i|
  MyEquipement.create!(
    user_id: i+1,
    equipement_id: 1
  )
end

puts "
---------------------------------------------------------------------
---------------------------------------------------------------------
        #{tp MyEquipement.all}
        Creation MyEquipements... #{MyEquipement.count}
        DONE
---------------------------------------------------------------------
---------------------------------------------------------------------
"

puts " 
                  ********************************* 
                  *                               * 
                  *          END OF SEED          * 
                  *                               * 
                  ********************************* 
"