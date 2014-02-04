# == Schema Information
#
# Table name: exercises
#
#  id         :integer          not null, primary key
#  name       :text
#  detail     :text
#  duration   :text
#  workout_id :integer
#  created_at :datetime
#  updated_at :datetime
#

class Exercise < ActiveRecord::Base
  has_and_belongs_to_many :workouts
  has_many :exercise_sessions
  # has_many :users, through: :exercise_sessions


  def active?
    self.workouts.each do |workout|
      workout.workout_sessions.each do |x|
        return true if x.accomplished?
      end
    end
  end
end
