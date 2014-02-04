class RemoveFieldStatusFromWorkoutSessions < ActiveRecord::Migration
  def change
    remove_column :workout_sessions, :status, :text
  end
end
