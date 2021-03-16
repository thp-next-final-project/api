# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
Meal.destroy_all

title = ["breakfast", "lunch", "diner"]


20.times do
  meals = Meal.create!(calorie: Faker::Number.number(digits: 3), name: Faker::Food.dish, title: title[rand(0..2)])
end

100.times do
    mods = Mod.create!(calorie: Faker::Number.number(digits: 4))
  end

500.times do
    ingredients = Ingredient.create!(name: Faker::Food.ingredient, cal_per_something: Faker::Number.number(digits: 2), quantity: Faker::Number.number(digits: 1), weight: Faker::Number.number(digits: 3) )
end
