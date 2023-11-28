# == Schema Information
#
# Table name: suggested_workouts
#
#  id           :integer          not null, primary key
#  cycle_phase  :string
#  workout_desc :string
#  workout_type :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :integer
#
class SuggestedWorkout < ApplicationRecord
end
