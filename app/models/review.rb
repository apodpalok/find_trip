class Review < ApplicationRecord
  belongs_to :user
  belongs_to :author, class_name: 'User'

  validates :rating, :comment, presence: true
end
