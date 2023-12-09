class AdminWorkoutsController < ApplicationController
  def index
    matching_admin_workouts = AdminWorkout.all

    @list_of_admin_workouts = matching_admin_workouts.order({ :created_at => :desc })

    render({ :template => "admin_workouts/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_admin_workouts = AdminWorkout.where({ :id => the_id })

    @the_admin_workout = matching_admin_workouts.at(0)

    render({ :template => "admin_workouts/show" })
  end

  def create
    the_admin_workout = AdminWorkout.new
    the_admin_workout.workout_type = params.fetch("query_workout_type")
    the_admin_workout.workout_desc = params.fetch("query_workout_desc")
    the_admin_workout.workout_phase = params.fetch("query_workout_phase")

    if the_admin_workout.valid?
      the_admin_workout.save
      redirect_to("/admin_workouts", { :notice => "Admin workout created successfully." })
    else
      redirect_to("/admin_workouts", { :alert => the_admin_workout.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_admin_workout = AdminWorkout.where({ :id => the_id }).at(0)

    the_admin_workout.workout_type = params.fetch("query_workout_type")
    the_admin_workout.workout_desc = params.fetch("query_workout_desc")
    the_admin_workout.workout_phase = params.fetch("query_workout_phase")

    if the_admin_workout.valid?
      the_admin_workout.save
      redirect_to("/admin_workouts/#{the_admin_workout.id}", { :notice => "Admin workout updated successfully."} )
    else
      redirect_to("/admin_workouts/#{the_admin_workout.id}", { :alert => the_admin_workout.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_admin_workout = AdminWorkout.where({ :id => the_id }).at(0)

    the_admin_workout.destroy

    redirect_to("/admin_workouts", { :notice => "Admin workout deleted successfully."} )
  end
end
