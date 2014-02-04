class WorkoutSessionsController < ApplicationController

def create
  session = WorkoutSession.new(workout_session_params)
  current_user.workout_sessions << session
  workout = Workout.find(workout_session_params[:workout_id])
  # Make sure workout.status is true
  workout.update!(started: true)
  # Create user exercise_sessions for all current exercises linked to this workout
  workout.exercises.each do |exercise|
    current_user.exercise_sessions << ExerciseSession.new(
      exercise_id: exercise.id,
      workout_id: workout.id,
      status: 'Pending')
  end
  flash[:notice] = 'Joined the workout!'
  redirect_to :back
end

def update
  workout_session = WorkoutSession.find(params[:id])
  workout_session.update_attributes(workout_session_params)
  redirect_to :back
end

def destroy
  workout_session = WorkoutSession.find(params[:id])
  workout = workout_session.workout
  workout_session.destroy!
  # Delete all exercise_sessions linked to user and workout
  exercise_sessions = workout.exercise_sessions.find_all_by_user_id(current_user.id)
  exercise_sessions.each do |x|
    x.destroy!
  end
  redirect_to :back
end

private

  def workout_session_params
    params.require(:workout_session).permit(:workout_id, :pr, :comment, :accomplished, :status)
  end
end
