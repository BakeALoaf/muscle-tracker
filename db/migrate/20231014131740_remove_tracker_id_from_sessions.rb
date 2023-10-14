class RemoveTrackerIdFromSessions < ActiveRecord::Migration[7.0]
  def change
    remove_column :sessions, :tracker_id, :integer
  end
end
