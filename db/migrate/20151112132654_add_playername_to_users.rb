class AddPlayernameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :playername, :string
  end
end
