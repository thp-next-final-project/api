class Exercice < ApplicationRecord
  has_many :my_performances
  has_many :exercices, through: :my_performances
  has_many :jointure_wod_exercices
  has_many :wods, through: :jointure_wod_exercices

  scope :warm_ups, -> { where(categorie: 'warm_up') }
  scope :buildings, -> { where(categorie: 'building') }
  scope :workouts, -> { where(categorie: 'workout') }
  scope :skills, -> { where(categorie: 'skill') }
end
