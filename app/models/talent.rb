class Talent < ApplicationRecord
  belongs_to :skill
  belongs_to :user
  has_many :sessions # note: no "presence: true" since a Talent may have not sessions

  validates :user_id, presence: true # referring to user profile
  validates :skill_id, presence: true
end
