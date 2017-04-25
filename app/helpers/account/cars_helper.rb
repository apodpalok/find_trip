module Account
  module CarsHelper
    def car_manufatories_for_select
      CarManufactory.pluck(:make, :id)
    end

    def car_models_for_select(car_manufactory)
      return [] if car_manufactory.blank?
      car_manufactory.car_models.pluck(:model, :id)
    end

    def select_type
      [['Седан', :sedan], ['Кабриолет', :cabriolet], ['Универсал', :wagon], ['Хэтчбэк', :hatchback],
      ['Пикап', :hatchback], ['Минивэн', :hatchback], ['Фургон', :hatchback], ['SUV', :hatchback]]
    end

    def select_color
      [['Красный', :red], ['Черный', :black], ['Серый', :grey], ['Синий', :blue], ['Белый', :white], 
      ['Коричневый', :brown], ['Розовый', :pink], ['Фиолетовый', :purple], ['Жёлтый', :yellow],
      ['Зелёный', :green], ['Бордовый', :vinous], ['Бежевый', :beige], ['Оранжевый', :orange]] 
    end

    def select_comfort
      [["Люкс", :luxe], ["Стандарт", :standard]]
    end
  end
end
