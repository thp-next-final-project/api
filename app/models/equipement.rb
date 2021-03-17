class Equipement < ApplicationRecord
  has_many :exercices
  has_many :my_equipements
  has_many :users, through: :my_equipements
end
