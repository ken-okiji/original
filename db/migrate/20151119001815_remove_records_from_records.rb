class RemoveRecordsFromRecords < ActiveRecord::Migration
  def change
    remove_column :records, :records, :integer
  end
end
