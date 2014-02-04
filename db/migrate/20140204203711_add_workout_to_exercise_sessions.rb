class AddWorkoutToExerciseSessions < ActiveRecord::Migration
  def change
    add_reference :exercise_sessions, :workout, index: true
  end
end
