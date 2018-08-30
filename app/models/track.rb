class Track < ApplicationRecord
  belongs_to :project

  has_many :sessions
  has_many :talents, through: :sessions
  has_many :messages
  has_many :audio_files, through: :sessions

  validates :name, presence: true
end
