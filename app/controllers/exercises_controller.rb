class ExercisesController < ApplicationController
  def index
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

  def exercise_params
    params.require(:exercise).permit(:name, :detail, :duration, :started)
  end
end
