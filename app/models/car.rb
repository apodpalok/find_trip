class Car < ApplicationRecord
  belongs_to :user
  belongs_to :car_manufactory, inverse_of: :cars
  belongs_to :car_model, inverse_of: :cars

  mount_uploader :photo, CarPhotoUploader
end
