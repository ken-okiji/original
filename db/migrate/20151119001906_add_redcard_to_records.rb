class AddRedcardToRecords < ActiveRecord::Migration
  def change
    add_column :records, :redcard, :integer
  end
end
