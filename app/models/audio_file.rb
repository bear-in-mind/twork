class AudioFile < ApplicationRecord
  belongs_to :uploaded_by, class_name: 'User', foreign_key: :user_id
  belongs_to :session
  has_many :comments, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :user_id, presence: true
  validates :session_id, presence: true

  mount_uploader :audio, AudioUploader

  def get_format
    File.extname(self.audio.url)
  end

end
