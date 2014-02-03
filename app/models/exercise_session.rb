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
#

class ExerciseSession < ActiveRecord::Base
  belongs_to :exercise
  belongs_to :user
end