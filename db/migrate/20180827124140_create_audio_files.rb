class CreateAudioFiles < ActiveRecord::Migration[5.2]
  def change
    create_table :audio_files do |t|
      t.string :name
      t.string :audio
      t.references :user, foreign_key: true
      t.references :session, foreign_key: true

      t.timestamps
    end
  end
end
