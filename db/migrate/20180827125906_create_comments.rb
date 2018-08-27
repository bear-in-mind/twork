class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :content
      t.time :track_instant
      t.references :user, foreign_key: true
      t.references :audio_file, foreign_key: true

      t.timestamps
    end
  end
end
