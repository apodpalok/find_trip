FactoryGirl.define do
  factory :user do
    sequence(:email, 100) { |n| "mail#{n}@gmail.com" }
    password 'password'
    password_confirmation 'password'
  end
end
