class AddParticipationTimeToRecords < ActiveRecord::Migration
  def change
    add_column :records, :participation_time, :integer
    add_column :records, :redcard, :integer
    add_column :records, :yellowcard, :integer
  end
end
