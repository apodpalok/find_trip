class User < ApplicationRecord
  has_many :cars

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
