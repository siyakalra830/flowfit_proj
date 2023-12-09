class WorkoutsController < ApplicationController
  def index
    # Retrieve all workouts for the current user
    @list_of_workouts = Workout.where({ :user_id => current_user.id })
    render({ :template => "workouts/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_workouts = Workout.where({ :id => the_id })

    @the_workout = matching_workouts.at(0)

    render({ :template => "workouts/show" })
  end

  def create
    the_workout = Workout.new
    the_workout.workout_type = params.fetch("query_workout_type")
    the_workout.workout_length_mins = params.fetch("query_workout_length_mins")
    the_workout.user_id = current_user.id

    if the_workout.valid?
      the_workout.save
      redirect_to("/workouts", { :notice => "Workout created successfully." })
    else
      redirect_to("/workouts", { :alert => the_workout.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_workout = Workout.where({ :id => the_id }).at(0)

    the_workout.workout_type = params.fetch("query_workout_type")
    the_workout.workout_length_mins = params.fetch("query_workout_length_mins")
    the_workout.user_id = params.fetch("query_username")

    if the_workout.valid?
      the_workout.save
      redirect_to("/workouts/#{the_workout.id}", { :notice => "Workout updated successfully."} )
    else
      redirect_to("/workouts/#{the_workout.id}", { :alert => the_workout.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_workout = Workout.where({ :id => the_id }).at(0)

    the_workout.destroy

    redirect_to("/workouts", { :notice => "Workout deleted successfully."} )
  end
end
