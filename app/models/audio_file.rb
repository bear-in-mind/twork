class AudioFile < ApplicationRecord
  belongs_to :uploaded_by, class_name: 'User', foreign_key: :user_id
  belongs_to :session
  belongs_to :track, through: :session

  mount_uploader :audio, AudioUploader
end
