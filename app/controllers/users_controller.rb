class UsersController < ApplicationController
  skip_before_action(:authenticate_user!, { :only => [:index] })
  
  def index
    if current_user
      @workouts = Workout.where({ :user_id => current_user.id })
    else
      # If there is no current_user, redirect to a login page or set @workouts to an empty array.
      # Redirect example: redirect_to("/login")
      # Or set @workouts to an empty array to avoid the error:
      @workouts = []
    end
    render({ :template => "users/profile" })
  end

  def home
    render({ :template => "users/home" })
  end

  def user_params
    params.require("user").permit("email", "username", "password", "password_confirmation", "date_of_last_period", "workouts" => [])
  end

  def create
    @user = User.new
    @user.email = params.fetch("email")
    @user.username = params.fetch("username")
    @user.password = params.fetch("password")
    @user.date_of_last_period = params.fetch("date_of_last_period")
    @user.password_confirmation = params.fetch("password_confirmation")
       
    if @user.save
      # Redirect to a success page, log the user in, etc.\
      render({ :template => "users/home" })
    else
      # Handle the error, e.g. render the form again with error messages.
    end
  end
end
