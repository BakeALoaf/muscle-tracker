class ChangeTrackerIdToNullableInSessions < ActiveRecord::Migration[7.0]
  def change
    change_column :sessions, :tracker_id, :integer, null: true
  end
end
