class AddOpponentTeamToRecords < ActiveRecord::Migration
  def change
    add_column :records, :opponent_team, :string
    add_column :records, :score, :string
    add_column :records, :goal, :integer
    add_column :records, :assist, :integer
  end
end
