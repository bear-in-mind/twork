class Talent < ApplicationRecord
  has_many :sessions
  belongs_to :skill
  belongs_to :user

  has_many :tracks, through: :sessions

  validates :user_id, presence: true # referring to user profile
  validates :skill_id, presence: true
  validates_uniqueness_of :skill_id, :scope => :user_id
end
