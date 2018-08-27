class CreateTracks < ActiveRecord::Migration[5.2]
  def change
    create_table :tracks do |t|
      t.string :name
      t.timestamp :updated_at
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
