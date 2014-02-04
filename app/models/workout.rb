# == Schema Information
#
# Table name: workouts
#
#  id         :integer          not null, primary key
#  name       :text
#  difficulty :text
#  posted     :boolean
#  started    :boolean
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Workout < ActiveRecord::Base
  belongs_to :user
  has_many :workout_sessions
  has_many :exercise_sessions
  # has_many :followers, through: :workout_sessions, source: :user
  has_and_belongs_to_many :exercises


  def self.my_workouts(user)
    my_workouts = []
    user.workout_sessions.each do |x|
      my_workouts << x.workout
    end
    my_workouts.sort_by! { |x| x.created_at }
  end

  def self.other_workouts(user)
    Workout.order(created_at: :desc) - my_workouts(user)
  end

end
