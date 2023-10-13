class RenametrackingsTotrackers < ActiveRecord::Migration[7.0]
  def change
    rename_table :trackings, :trackers
  end
end
