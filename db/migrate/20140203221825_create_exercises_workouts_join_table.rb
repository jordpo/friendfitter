class CreateExercisesWorkoutsJoinTable < ActiveRecord::Migration
  def change
    create_join_table :exercises, :workouts do |t|
      t.index [:exercise_id, :workout_id]
      t.index [:workout_id, :exercise_id]
    end
  end
end
