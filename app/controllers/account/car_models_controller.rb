module Account
  class CarModelsController < BaseController
    respond_to :json

    def index
      find_car_manufactory
      @car_models = @car_manufactory.car_models
      respond_with(@car_models)
    end

    private

    def find_car_manufactory
      @car_manufactory = CarManufactory.find(params[:car_manufactory_id])
    end
  end
end
