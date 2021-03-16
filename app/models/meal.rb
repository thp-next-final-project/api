class Meal < ApplicationRecord
    enum title: { breakfast: 'breakfast', lunch: 'lunch', diner: 'diner' }
    has_many :jointure_meals
    has_many :mods, through: :jointure_meals
    has_many :jointure_ingredients
    has_many :ingredients, through: :jointure_ingredients
end
