class CarModel < ApplicationRecord
  has_many :manufactory_car_models
  has_many :car_manyfactories, through: :manufactory_car_models
end
