FactoryGirl.define do
  factory :trip do
    start_location 'Киев'
    finish_location 'Черкассы'
    start_time DateTime.now + 1.day
    price 99
  end
end
