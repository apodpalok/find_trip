class ManufactoryCarModel < ApplicationRecord
  belongs_to :car_manufactory
  belongs_to :car_model
end
