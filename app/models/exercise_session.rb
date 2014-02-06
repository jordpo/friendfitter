# == Schema Information
#
# Table name: exercise_sessions
#
#  id           :integer          not null, primary key
#  exercise_id  :integer
#  user_id      :integer
#  pr           :boolean
#  comment      :text
#  mod          :text
#  accomplished :boolean
#  status       :text
#  workout_id   :integer
#

class ExerciseSession < ActiveRecord::Base
  belongs_to :exercise
  belongs_to :user
  belongs_to :workout
end
