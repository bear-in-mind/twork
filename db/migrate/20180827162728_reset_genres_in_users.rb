class ResetGenresInUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :genres, :string
    add_column :users, :genres, :text, array: true, default: []
  end
end
