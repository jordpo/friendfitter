class WorkoutsController < ApplicationController
  def index
    @workouts = Workout.all
  end

  def show
    @workout = Workout.find(params[:id])
  end

  def new
    @workout = Workout.new
  end

  def create
    @workout = Workout.new(workout_params)
    current_user.workouts << @workout
    redirect_to @workout
  end

  def edit
    @workout = Workout.find(params[:id])
  end

  def update
    @workout = Workout.find(params[:id])
    @workout.update_attributes!(workout_params)
    redirect_to @workout
  end

  def destroy
  end


  private

  def workout_params
    params.require(:workout).permit(:name, :difficulty, :posted, :started)
  end
end
