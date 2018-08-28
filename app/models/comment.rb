class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :user_id
  belongs_to :audio_file

  validates :content, presence: true
  validates :user_id, presence: true
  validates :audio_file_id, presence: true
end
