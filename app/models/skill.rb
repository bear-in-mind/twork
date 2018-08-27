class Skill < ApplicationRecord
  has_many :talents

  validates :name, presence: true
end
