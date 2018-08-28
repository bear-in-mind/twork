class Talent < ApplicationRecord
  belongs_to :skill
  belongs_to :user
  has_many :sessions

  validates :user, :skill, presence: true
end
