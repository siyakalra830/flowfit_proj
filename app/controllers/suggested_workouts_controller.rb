class SuggestedWorkoutsController < ApplicationController
  def index
    matching_suggested_workouts = SuggestedWorkout.all

    @list_of_suggested_workouts = matching_suggested_workouts.order({ :created_at => :desc })

    render({ :template => "suggested_workouts/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_suggested_workouts = SuggestedWorkout.where({ :id => the_id })

    @the_suggested_workout = matching_suggested_workouts.at(0)

    render({ :template => "suggested_workouts/show" })
  end

  def create
    the_suggested_workout = SuggestedWorkout.new
    the_suggested_workout.workout_type = params.fetch("query_workout_type")
    the_suggested_workout.cycle_phase = params.fetch("query_cycle_phase")
    the_suggested_workout.workout_desc = params.fetch("query_workout_desc")
    the_suggested_workout.user_id = params.fetch("query_user_id")

    if the_suggested_workout.valid?
      the_suggested_workout.save
      redirect_to("/suggested_workouts", { :notice => "Suggested workout created successfully." })
    else
      redirect_to("/suggested_workouts", { :alert => the_suggested_workout.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_suggested_workout = SuggestedWorkout.where({ :id => the_id }).at(0)

    the_suggested_workout.workout_type = params.fetch("query_workout_type")
    the_suggested_workout.cycle_phase = params.fetch("query_cycle_phase")
    the_suggested_workout.workout_desc = params.fetch("query_workout_desc")
    the_suggested_workout.user_id = params.fetch("query_user_id")

    if the_suggested_workout.valid?
      the_suggested_workout.save
      redirect_to("/suggested_workouts/#{the_suggested_workout.id}", { :notice => "Suggested workout updated successfully."} )
    else
      redirect_to("/suggested_workouts/#{the_suggested_workout.id}", { :alert => the_suggested_workout.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_suggested_workout = SuggestedWorkout.where({ :id => the_id }).at(0)

    the_suggested_workout.destroy

    redirect_to("/suggested_workouts", { :notice => "Suggested workout deleted successfully."} )
  end
end
