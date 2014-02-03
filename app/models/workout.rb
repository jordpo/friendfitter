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
  has_many :users, through: :workout_sessions
end
