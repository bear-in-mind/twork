class Skill < ApplicationRecord
  has_many :talents
  has_many :users, through: :talents
end
