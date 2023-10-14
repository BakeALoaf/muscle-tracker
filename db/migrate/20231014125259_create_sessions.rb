class CreateSessions < ActiveRecord::Migration[7.0]
  def change
    create_table :sessions do |t|
      t.string :workout
      t.references :tracker, null: false, foreign_key: true

      t.timestamps
    end
  end
end
