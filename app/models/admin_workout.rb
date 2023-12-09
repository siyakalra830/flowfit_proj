# == Schema Information
#
# Table name: admin_workouts
#
#  id            :integer          not null, primary key
#  workout_desc  :string
#  workout_phase :string
#  workout_type  :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class AdminWorkout < ApplicationRecord
  has_many  :suggested_workouts, class_name: "SuggestedWorkout", foreign_key: "admin_workouts_id", dependent: :destroy
end
