class CreateSuggestedWorkouts < ActiveRecord::Migration[7.0]
  def change
    create_table :suggested_workouts do |t|
      t.string :workout_type
      t.string :cycle_phase
      t.string :workout_desc
      t.integer :user_id

      t.timestamps
    end
  end
end
