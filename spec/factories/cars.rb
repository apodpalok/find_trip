FactoryGirl.define do
  factory :car do
    comfort 'cool'
    color { Faker::Color.color_name }
    number_seats { Faker::Number.between(1, 10) }
    user
    car_manufactory
    car_model
  end
end
