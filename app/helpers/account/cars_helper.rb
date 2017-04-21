module Account
  module CarsHelper
    def car_manufatories_for_select
      CarManufactory.pluck(:make, :id)
    end

    def car_models_for_select(car_manufactory)
      car_manufactory.car_models.pluck(:model, :id)
    end
  end
end
