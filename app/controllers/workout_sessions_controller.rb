class WorkoutSessionsController < ApplicationController

def create
  session = WorkoutSession.new(workout_session_params)
  current_user.workout_sessions << session
  flash[:notice] = 'Joined the workout!'
  redirect_to :back
end

def update
  workout_session = WorkoutSession.find(params[:id])
  workout_session.update_attributes(workout_session_params)
  redirect_to :back
end

def destroy
  workout_session.find(params[:id]).destroy!
  redirect_to :back
end

private

  def workout_session_params
    params.require(:workout_session).permit(:workout_id, :pr, :comment, :accomplished, :status)
  end
end
