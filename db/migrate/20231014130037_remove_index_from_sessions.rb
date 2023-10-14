class RemoveIndexFromSessions < ActiveRecord::Migration[7.0]
  def change
    remove_index :sessions, name: "index_sessions_on_tracker_id"
  end
end
