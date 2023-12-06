class UsersController < ApplicationController
  skip_before_action(:authenticate_user!, { :only => [:index] })
  
  def index
    render({ :template => "users/profile" })
  end

  def home
    render({ :template => "users/home" })
  end
end
