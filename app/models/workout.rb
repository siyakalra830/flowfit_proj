# == Schema Information
#
# Table name: workouts
#
#  id                  :integer          not null, primary key
#  workout_length_mins :integer
#  workout_type        :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  user_id             :integer
#
class Workout < ApplicationRecord
  belongs_to :user, required: true, class_name: "User", foreign_key: "user_id", counter_cache: true
end
