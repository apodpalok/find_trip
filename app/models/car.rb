class Car < ApplicationRecord
  belongs_to :user

  mount_uploader :photo, CarPhotoUploader
end
