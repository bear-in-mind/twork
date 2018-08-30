class AddBriefToTracks < ActiveRecord::Migration[5.2]
  def change
    add_column :tracks, :brief, :text
  end
end
