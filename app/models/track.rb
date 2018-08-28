class Track < ApplicationRecord
  belongs_to :project

  has_many :audio_files, through: :sessions
  has_many :sessions
  has_many :messages

  validates :name, presence: true, uniqueness: true
end
