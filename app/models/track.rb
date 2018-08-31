class Track < ApplicationRecord
  belongs_to :project

  has_many :sessions, dependent: :destroy
  has_many :talents, through: :sessions
  has_many :audio_files, through: :sessions
  has_many :messages

  validates :name, presence: true
end
