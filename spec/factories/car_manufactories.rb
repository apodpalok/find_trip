FactoryGirl.define do
  factory :car_manufactory do
    make { Faker::Hipster.word }
  end
end
