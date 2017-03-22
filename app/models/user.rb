class User < ApplicationRecord
  has_many :cars
  has_many :trips

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
