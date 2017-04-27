class CarPhotoUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url
    ActionController::Base.helpers.asset_path([version_name, 'car-photo.jpg'].compact.join('_'))
  end

  version :thumb do
    process resize_to_fit: [100, 100]
  end

  version :medium do
    process resize_to_fit: [250, 250]
  end

  version :small do
    process resize_to_fit: [140, 140]
  end

  def extension_whitelist
    %w[jpg jpeg gif png]
  end
end
