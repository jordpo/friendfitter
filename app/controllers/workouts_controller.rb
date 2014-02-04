class WorkoutsController < ApplicationController
  def index
    @workouts = Workout.all
  end

  def show
  end

  def new
  end

  def create
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
