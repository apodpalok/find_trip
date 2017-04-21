class CarModel < ApplicationRecord
  has_many :manufactory_car_models
  has_many :car_manufactories, through: :manufactory_car_models
  has_many :cars, inverse_of: :car_model
end
