class CreateSessions < ActiveRecord::Migration[5.2]
  def change
    create_table :sessions do |t|
      t.string :status
      t.references :track, foreign_key: true
      t.references :talent, foreign_key: true

      t.timestamps
    end
  end
end
