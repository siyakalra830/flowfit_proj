class CreateAdminWorkouts < ActiveRecord::Migration[7.0]
  def change
    create_table :admin_workouts do |t|
      t.string :workout_type
      t.string :workout_desc
      t.string :workout_phase

      t.timestamps
    end
  end
end
