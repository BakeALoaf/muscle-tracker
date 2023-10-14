class AddSessionToTrackers < ActiveRecord::Migration[7.0]
  def change
    add_reference :trackers, :session, null: false, foreign_key: true
  end
end
