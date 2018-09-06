class AddCompletedToSessions < ActiveRecord::Migration[5.2]
  def change
    add_column :sessions, :completed, :boolean, default: false
  end
end
