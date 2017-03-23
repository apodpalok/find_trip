class Trip < ApplicationRecord
  #belongs_to :user
  
  validates :start_location, presence: true
  validates :finish_location, presence: true
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0  }

  before_save :geocode_start_location
  before_save :geocode_finish_location

  def self.search(search_from, search_to)
    self.where("start_location LIKE ? and finish_location LIKE ?", "%#{search_from}%", "%#{search_to}%")
  end

  def geocode_start_location
    coords = Geocoder.coordinates(self.start_location)
    self.start_latitude = coords[0]
    self.start_longitude = coords[1]
  end

  def geocode_finish_location
    coords = Geocoder.coordinates(self.finish_location)
    self.finish_latitude = coords[0]
    self.finish_longitude = coords[1]
  end
end
