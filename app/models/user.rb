# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  date_of_last_period    :date
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  length_of_cycle        :integer
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  username               :string
#  workouts_count         :integer
#  workouts_enjoyed       :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many  :workouts, class_name: "Workout", foreign_key: "user_id", dependent: :destroy

  has_many  :suggested_workouts, class_name: "SuggestedWorkout", foreign_key: "user_id", dependent: :destroy
end
