class CarManufactory < ApplicationRecord
  has_many :manufactory_car_models
  has_many :car_models, through: :manufactory_car_models
end
