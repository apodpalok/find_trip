class Trip < ApplicationRecord
  validates :start_location, presence: true
  validates :finish_location, presence: true
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0  }

  def self.search(search_from, search_to)
    self.where("start_location LIKE ? and finish_location LIKE ?", "%#{search_from}%", "%#{search_to}%")
  end
end
