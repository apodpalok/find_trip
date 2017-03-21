class Trip < ApplicationRecord
  validates :start_location, presence: true
  validates :finish_location, presence: true
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0  }
end
