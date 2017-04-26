FactoryGirl.define do
  factory :car_model do
    model { Faker::Hipster.word }
  end
end
