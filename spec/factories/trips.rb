FactoryGirl.define do
  factory :trip do
    start_location 'Киев'
    finish_location 'Черкассы'
    start_time Date.today + 1.day
    seats 2
    price 99
  end
end
