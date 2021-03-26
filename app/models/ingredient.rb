class Ingredient < ApplicationRecord
    has_many :jointure_ingredients
    has_many :meals, through: :jointure_ingredients
end
