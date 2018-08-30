class Message < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :user_id
  belongs_to :track

  validates :content, :track_id, :user_id, presence: true
end
