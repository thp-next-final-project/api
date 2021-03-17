# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

p " ********************************* "
p " *                               * "
p " *         BEGIN OF SEED         * "
p " *                               * "
p " ********************************* "

## /!\ A COMMENTER SI PUSH SUR GITHUB (HEROKU) /!\ ##
User.destroy_all
Meal.destroy_all
Mod.destroy_all
Ingredient.destroy_all
MyEquipement.destroy_all
Exercice.destroy_all


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

p "#{tp User.all}"
p "Creation Users... #{User.count}"
puts "DONE"
p "-----------------------"
p "-----------------------"

############################
##          MEAL          ##
############################ 

title = ["breakfast", "lunch", "diner"]
sexe = ["man", "woman"]
objectif = ["slim", "build", "maintain"]
activity = ["sedentary", "active", "sporty"]


20.times do
  meals = Meal.create!(calorie: Faker::Number.number(digits: 3), name: Faker::Food.dish, title: title[rand(0..2)])
end

100.times do
    mods = Mod.create!(calorie: Faker::Number.number(digits: 4))
  end

500.times do
    ingredients = Ingredient.create!(name: Faker::Food.ingredient, cal_per_something: Faker::Number.number(digits: 2), quantity: Faker::Number.number(digits: 1), weight: Faker::Number.number(digits: 3) )
end


# 10.times do
#   my_objectif = MyObjectif.create!(calorie: Faker::Number.number(digits: 4), age: Faker::Number.number(digits: 2) , height: Faker::Number.number(digits: 3) , weight: Faker::Number.number(digits: 2), sexe: sexe[rand(0..1)] , objectif: objectif[rand(0..2)] , activity: activity[rand(0..2)] )
# end


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

p "#{tp Equipement.all}"
p "Creation Equipements... #{Equipement.count}"
puts "DONE"
p "-----------------------"
p "-----------------------"

exercices.length.times do |i|
  Exercice.create!(
    name: exercices[i][:name],
    categorie: exercices[i][:categorie],
    cal: exercices[i][:cal],
    description: exercices[i][:description],
    equipement_id: rand(1..equipements.length)
  )
end

p "#{tp Exercice.all}"
p "Creation Exercices... #{Exercice.count}"
puts "DONE"
p "-----------------------"
p "-----------------------"


5.times do |i|
  MyEquipement.create!(
    user_id: i + 1,
    equipement_id: rand(1..equipements.length)
  )
end

p "#{tp MyEquipement.all}"
p "Creation MyEquipements... #{MyEquipement.count}"
puts "DONE"
p "-----------------------"
p "-----------------------"

p " ********************************* "
p " *                               * "
p " *          END OF SEED          * "
p " *                               * "
p " ********************************* "

