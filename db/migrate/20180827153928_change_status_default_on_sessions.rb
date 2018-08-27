class ChangeStatusDefaultOnSessions < ActiveRecord::Migration[5.2]
  def change
    change_column :sessions, :status, :string, :default => "In progress"
  end
end
