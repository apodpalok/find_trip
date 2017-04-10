FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password 'password'
    password_confirmation 'password'
  end

  factory :author, class: User do
    email { Faker::Internet.email }
    password 'password'
    password_confirmation 'password'
  end
end
