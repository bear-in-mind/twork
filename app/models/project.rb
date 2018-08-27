class Project < ApplicationRecord
  belongs_to :project_owner, class_name: 'User', foreign_key: :user_id
  has_many :tracks, dependent: :destroy

  validates :name, :deadline, presence: true
end
