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
  end

  def update
  end

  def destroy
  end


  private

  def workout_params
    params.require(:workout).permit(:name, :difficulty, :posted, :started)
  end
end
