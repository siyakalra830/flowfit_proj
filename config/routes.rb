Rails.application.routes.draw do
  # Routes for the Admin workout resource:

  # CREATE
  post("/insert_admin_workout", { :controller => "admin_workouts", :action => "create" })
          
  # READ
  get("/admin_workouts", { :controller => "admin_workouts", :action => "index" })
  
  get("/admin_workouts/:path_id", { :controller => "admin_workouts", :action => "show" })
  
  # UPDATE
  
  post("/modify_admin_workout/:path_id", { :controller => "admin_workouts", :action => "update" })
  
  # DELETE
  get("/delete_admin_workout/:path_id", { :controller => "admin_workouts", :action => "destroy" })

  #------------------------------

  # Routes for the Suggested workout resource:

  # CREATE
  post("/insert_suggested_workout", { :controller => "suggested_workouts", :action => "create" })
          
  # READ
  get("/suggested_workouts", { :controller => "suggested_workouts", :action => "index" })
  
  get("/suggested_workouts/:path_id", { :controller => "suggested_workouts", :action => "show" })
  
  # UPDATE
  
  post("/modify_suggested_workout/:path_id", { :controller => "suggested_workouts", :action => "update" })


  
  # DELETE
  get("/delete_suggested_workout/:path_id", { :controller => "suggested_workouts", :action => "destroy" })

  #------------------------------

  # Routes for the Workout resource:

  # CREATE
  post("/insert_workout", { :controller => "workouts", :action => "create" })
          
  # READ
  get("/workouts", { :controller => "workouts", :action => "index" })
  
  get("/workouts/:path_id", { :controller => "workouts", :action => "show" })
  
  # UPDATE
  
  post("/modify_workout/:path_id", { :controller => "workouts", :action => "update" })
  
  # DELETE
  get("/delete_workout/:path_id", { :controller => "workouts", :action => "destroy" })

  #------------------------------

  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get("/profile", { :controller => "users", :action => "index" })

  post("/users/sign_up", { :controller => "users", :action => 'create' })


  
  # Defines the root path route ("/")
  root "users#home"
end
