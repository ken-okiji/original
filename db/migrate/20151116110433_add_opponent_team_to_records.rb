class AddOpponentTeamToRecords < ActiveRecord::Migration
  def change
    add_column :records, :opponent_team, :string
    add_column :records, :date, :string
    add_column :records, :score, :string
    add_column :records, :goal, :integer
    add_column :records, :assist, :integer
    add_column :records, :participation_time, :integer
    add_column :records, :redcard, :integer
    add_column :records, :yellowcard, :integer
  end
end
