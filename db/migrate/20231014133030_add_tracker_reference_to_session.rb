class AddTrackerReferenceToSession < ActiveRecord::Migration[7.0]
  def change
    add_reference :sessions, :tracker, null: true, foreign_key: true
  end
end
