class AudioFile < ApplicationRecord
  belongs_to :user
  belongs_to :session

  mount_uploader :audio, AudioUploader
end
