# == Schema Information
#
# Table name: suggested_workouts
#
#  id                :integer          not null, primary key
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  admin_workouts_id :integer
#  user_id           :integer
#
class SuggestedWorkout < ApplicationRecord
  belongs_to :user, required: true, class_name: "User", foreign_key: "user_id"

  belongs_to :admin_workouts, required: true, class_name: "AdminWorkout", foreign_key: "admin_workouts_id"
end
