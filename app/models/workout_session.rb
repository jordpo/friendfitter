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
#

class WorkoutSession < ActiveRecord::Base
  belongs_to :workout
  belongs_to :user

  def mod_count
    count = 0
    self.workout.exercise_sessions.includes(:user, :workout).each do |exercise|
      exercise.user == self.user && exercise.workout == self.workout && exercise.modified? ? count += 1 : count += 0
    end
    count
  end

end
