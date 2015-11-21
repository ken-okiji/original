class AddUsernameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string
    add_column :users, :area, :string
    add_column :users, :age, :integer
    add_column :users, :playername, :string
    add_column :users, :team, :string
    add_column :users, :position, :string
  end
end
