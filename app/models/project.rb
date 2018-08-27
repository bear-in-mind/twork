class Project < ApplicationRecord
  belongs_to :project_owner, class_name: 'User', foreign_key: :user_id
end
