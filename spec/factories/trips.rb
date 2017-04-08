FactoryGirl.define do
  factory :trip do
    start_location 'Киев'
    finish_location 'Черкассы'
    start_time DateTime.new(2017, 3, 30, 11)
    price 99
  end
end
