FactoryGirl.define do
  factory :trip do
    start_location 'Киев'
    finish_location 'Черкассы'
    start_time 10.days.from_now
    price 99
  end
end
