class AudioFile < ApplicationRecord
  belongs_to :uploaded_by, class_name: 'User', foreign_key: :user_id
  belongs_to :session

  validates :name, presence: true, uniqueness: true
  validates :user_id, presence: true
  validates :session_id, presence: true

  mount_uploader :audio, AudioUploader
end
