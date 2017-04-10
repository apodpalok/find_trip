FactoryGirl.define do
  factory :review do
    user
    author
    rating 5
    comment 'Замечательный водитель!'
  end
end
