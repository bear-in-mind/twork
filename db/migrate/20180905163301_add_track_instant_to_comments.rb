class AddTrackInstantToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :track_instant, :integer
  end
end
