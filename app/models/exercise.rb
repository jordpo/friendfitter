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
  belongs_to :workout
  has_many :exercise_sessions
  has_many :users, through: :exercise_sessions
end
