class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :avatar, :string
    add_column :users, :banner, :string
    add_column :users, :bio, :text
    add_column :users, :genres, :string
    add_column :users, :main_occupation, :string
  end
end
