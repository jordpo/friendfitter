class WorkoutSessionsController < ApplicationController
before_action :find_workout_session, only: [:update, :destroy]

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
  @workout_session.assign_attributes(workout_session_params)
  if @workout_session.save
    flash[:notice] = 'Workout finished!'
    redirect_to :back
  else
    flash[:errors] = @workout_session.errors.full_messages.join(', ')
    redirect_to :back
  end
end

def destroy
  workout = @workout_session.workout
  @workout_session.destroy!
  # Delete all exercise_sessions linked to user and workout
  exercise_sessions = workout.exercise_sessions.find_all_by_user_id(current_user.id)
  exercise_sessions.each do |x|
    x.destroy!
  end
  redirect_to :back
end

private
  def find_workout_session
    @workout_session = WorkoutSession.find(params[:id])
  end

  def workout_session_params
    params.require(:workout_session).permit(:workout_id, :pr, :comment, :accomplished)
  end
end
