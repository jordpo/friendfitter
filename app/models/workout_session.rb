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
    self.workout.exercises.each do |exercise|
      exercise.exercise_sessions.each do |x|
        x.user == self.user && x.workout == self.workout && x.modified? ? count += 1 : count += 0
      end
    end
    count
  end

end
