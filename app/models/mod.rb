class Mod < ApplicationRecord
    has_many :jointure_meals
    has_many :meals, through: :jointure_meals
end
