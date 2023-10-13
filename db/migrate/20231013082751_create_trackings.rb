class CreateTrackings < ActiveRecord::Migration[7.0]
  def change
    create_table :trackings do |t|
      t.string :workout
      t.integer :weight
      t.integer :reps
      t.integer :sets

      t.timestamps
    end
  end
end
