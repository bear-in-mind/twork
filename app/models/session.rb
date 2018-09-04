class Session < ApplicationRecord
  belongs_to :track
  belongs_to :talent
  has_many :audio_files, dependent: :destroy
  validates :talent, presence: true
end
