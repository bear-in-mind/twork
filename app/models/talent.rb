class Talent < ApplicationRecord
  has_many :sessions
  belongs_to :skill
  belongs_to :user

  has_many :tracks, through: :sessions

  validates :user_id, presence: true # referring to user profile
  validates :skill_id, presence: true
  validates_uniqueness_of :skill_id, :scope => :user_id

  def talent_name
    "#{self.user.first_name.capitalize} #{self.user.last_name.upcase} (#{self.skill.name})"
  end
end
