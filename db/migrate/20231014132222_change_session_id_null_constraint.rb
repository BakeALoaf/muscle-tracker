class ChangeSessionIdNullConstraint < ActiveRecord::Migration[7.0]
  def change
    change_column_null :trackers, :session_id, true
  end
end
