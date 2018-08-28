class Track < ApplicationRecord
  belongs_to :project

  has_many :audio_files, through: :sessions
end
