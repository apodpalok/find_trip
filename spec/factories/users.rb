FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password 'password'
    password_confirmation 'password'
    first_name 'Anna'
    last_name 'Anna'
    avatar File.open(File.join(Rails.root, '/spec/fixtures/default-avatar.jpg'))
  end

  factory :author, class: User do
    email { Faker::Internet.email }
    password 'password'
    password_confirmation 'password'
    first_name 'Maria'
    last_name 'Maria'
  end
end
