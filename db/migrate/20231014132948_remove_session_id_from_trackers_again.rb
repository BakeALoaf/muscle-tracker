class RemoveSessionIdFromTrackersAgain < ActiveRecord::Migration[7.0]
  def change
    remove_reference :trackers, :session, foreign_key: true
  end
end
