class Skill < ApplicationRecord
  has_many :talents
  has_many :users, through: :talents

  validates :name, presence: true
end
