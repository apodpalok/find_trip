class User < ApplicationRecord
  has_many :cars
  has_many :trips
  mount_uploader :avatar, AvatarUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
