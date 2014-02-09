class AddModToExerciseSessions < ActiveRecord::Migration
  def change
    add_column :exercise_sessions, :modified, :boolean
    add_column :exercise_sessions, :exercise_mod, :integer
  end
end
