class User < ApplicationRecord
  devise  :database_authenticatable,
          :registerable,
		      :jwt_authenticatable, 
          jwt_revocation_strategy: JwtDenylist

  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "is not a valid email" }
  validates_presence_of :firstname,
                        :lastname,
                        :role

  # enum role: { user: 'user', admin: 'admin', coach: 'coach', chef: 'chef' }

  scope :users, -> { where(role: 'user') }
  scope :admins, -> { where(role: 'admin') }
  scope :coachs, -> { where(role: 'coach') }
  scope :chefs, -> { where(role: 'chef') }

  has_many :my_equipements
  has_many :equipements, through: :my_equipements
  has_many :my_performances
  has_many :exercices, through: :my_performances

  after_update :compute_calories

  private

  def compute_metabolism
    if self.sexe == "man"
      return 13.7516 * self.weight + 500.33 * self.height - 6.7550 * self.age + 66.473
    end
    if self.sexe == "woman"
      return 9.5634 * self.weight + 184.96 * self.height - 4.6756 * self.age + 655.0955
    end
  end

  def compute_needed_calories
    case self.activity
    when "sedentary"
      return compute_metabolism * 1.37
    when "active"
      return compute_metabolism * 1.55
    when "athletic"
      return compute_metabolism * 1.80
    end
  end

  def compute_calories
    case self.objectif
    when "slim"
      self.calories = compute_needed_calories - compute_needed_calories * 0.1
    when "maintain"
      self.calories = compute_needed_calories
    when "build"
      self.calories = compute_needed_calories + compute_needed_calories * 0.1
    end
  end
end
