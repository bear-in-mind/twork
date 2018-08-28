class AvatarUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  process convert: 'jpg'

  version :profile_picture do
    cloudinary_transformation width: 200, height: 200, crop: :fill, gravity: :face, border: "3px_solid_white"
  end

end
