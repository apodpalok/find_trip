class User < ApplicationRecord
  has_many :cars
  has_many :reviews, dependent: :destroy
  has_many :trip_memberships
  has_many :trips, through: :trip_memberships
  has_and_belongs_to_many :trips_as_driver, class_name: 'Trip', join_table: 'drivers_trips',
                                            foreign_key: 'driver_id'
  has_and_belongs_to_many :trips_as_passenger, join_table: 'passengers_trips',
                                               foreign_key: 'passenger_id'

  mount_uploader :avatar, AvatarUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
