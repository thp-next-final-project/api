class User < ApplicationRecord
  devise  :database_authenticatable,
          :registerable,
		      :jwt_authenticatable, 
          jwt_revocation_strategy: JwtDenylist
  
  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "is not a valid email" }
  validates_presence_of :firstname,
                        :lastname,
                        :role,
                        :age

  enum role: { user: 'user', admin: 'admin', coach: 'coach', chef: 'chef' }
  belongs_to :my_objectif

  scope :users, -> { where(role: 'user') }
  scope :admins, -> { where(role: 'admin') }
  scope :coachs, -> { where(role: 'coach') }
  scope :chefs, -> { where(role: 'chef') }

end
