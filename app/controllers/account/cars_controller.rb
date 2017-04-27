module Account
  class CarsController < BaseController
    before_action :find_car, only: [:destroy, :edit, :update]

    def index
      @user_cars = current_user.cars
    end

    def new
      @car = current_user.cars.build
    end

    def create
      @car = current_user.cars.build(car_params)

      if @car.save
        redirect_to account_cars_path, notice: 'Авто добавлено'
      else
        render :new
      end
    end

    def edit; end

    def update
      if @car.update(car_params)
        redirect_to account_cars_path, notice: 'Обновлено'
      else
        render :edit
      end
    end

    def destroy
      @car.destroy
      redirect_to account_cars_path
    end

    private

    def car_params
      params.require(:car).permit(:car_type, :color, :comfort, :photo,
                                  :car_manufactory_id, :car_model_id)
    end

    def find_car
      @car = current_user.cars.find(params[:id])
    end
  end
end
