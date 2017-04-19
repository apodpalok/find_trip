module Account
  class CarsController < BaseController
    before_action :current_user_car, only: [:show, :edit]
    before_action :find_car, only: [:destroy, :edit, :update]

    def index
      @user_cars = current_user.cars
    end

    def new
      @car = Car.new
    end

    def create
      @car = current_user.cars.new(car_params)

      if @car.save
        redirect_to account_cars_path, alert: 'Авто добавлено'
      else
        render :new
      end
    end

    def edit; end

    def update
      @car.update(car_params)
      redirect_to account_cars_path, notice: "Обновлено"
    end

    def destroy
      @car.destroy
      redirect_to account_cars_path
    end

    private

    def car_params
      params.require(:car).permit(:car_type, :color, :comfort, :number_of_seats, :photo)
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
