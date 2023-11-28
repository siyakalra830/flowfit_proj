class CreateWorkouts < ActiveRecord::Migration[7.0]
  def change
    create_table :workouts do |t|
      t.string :workout_type
      t.integer :workout_length_mins
      t.integer :user_id

      t.timestamps
    end
  end
end
