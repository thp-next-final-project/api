class Meal < ApplicationRecord
    enum title: { breakfast: 'breakfast', lunch: 'lunch', dinner: 'dinner' }
    has_many :jointure_meals
    has_many :mods, through: :jointure_meals
    has_many :jointure_ingredients
    has_many :ingredients, through: :jointure_ingredients

    scope :breakfasts, -> { where(title: 'breakfast') }
    scope :lunchs, -> { where(title: 'lunch') }
    scope :dinners, -> { where(title: 'dinner') }
end
