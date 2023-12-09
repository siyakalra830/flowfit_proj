class AddAdminWorkoutsIdToSuggestedWorkouts < ActiveRecord::Migration[7.0]
  def change
    add_column :suggested_workouts, :admin_workouts_id, :integer
    remove_column :suggested_workouts, :workout_desc, :string
    remove_column :suggested_workouts, :cycle_phase, :string
    remove_column :suggested_workouts, :workout_type, :string
  end
end
