class ExerciseSessionsController < ApplicationController

def update
  @exercise_session = ExerciseSession.find(params[:id])
  @exercise_session.assign_attributes(exercise_session_params)
  if @exercise_session.save
    flash[:notice] = 'Exercise Session Updated!'
    redirect_to :back
  else
    flash[:errors] = @exercise.errors.full_messages.join(', ')
    redirect_to :back
  end
end


  private

  def exercise_session_params
    params.require(:exercise_session).permit(:exercise_id, :pr, :comment, :accomplished, :mod)
  end
end
