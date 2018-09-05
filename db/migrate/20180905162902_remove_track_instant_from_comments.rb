class RemoveTrackInstantFromComments < ActiveRecord::Migration[5.2]
  def change
    remove_column :comments, :track_instant
  end
end
