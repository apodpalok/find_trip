module Account
  class CarsController < BaseController
    before_action :current_user_car, only: [:show, :edit]
    before_action :find_car, only: [:show, :edit, :update]

    def index
      @user_cars = current_user.cars
    end

    def new
      @car = Car.new
    end

    def create
      @car = current_user.cars.new(car_params)

      if @car.save
        redirect_to [:account, @car], alert: 'Авто добавлено'
      else
        render :new
      end
    end

    def show; end

    def edit; end

    def update; end

    private

    def car_params
      params.require(:car).permit(:color, :comfort, :number_of_seats)
    end

    def find_car
      @car = Car.find(params[:id])
    end

    def current_user_car
      return if current_user.cars.exists?(id: find_car.id)
      not_found
    end
  end
end
