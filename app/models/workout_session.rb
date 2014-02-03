# == Schema Information
#
# Table name: workout_sessions
#
#  id           :integer          not null, primary key
#  workout_id   :integer
#  user_id      :integer
#  pr           :boolean
#  comment      :text
#  accomplished :boolean
#  status       :text
#

class WorkoutSession < ActiveRecord::Base
  belongs_to :workout
  belongs_to :user
end
