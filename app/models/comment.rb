class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :audio_file
end
