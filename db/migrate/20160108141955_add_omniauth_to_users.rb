class AddOmniauthToUsers < ActiveRecord::Migration[4.2]
  def change
    add_column :users, :provider, :string
    add_index :users, :provider
    add_column :users, :steamid, :string
    add_index :users, :steamid
  end
end
