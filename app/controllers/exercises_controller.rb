class ExercisesController < ApplicationController
  before_action :get_exercise, only: [:show, :edit, :update, :destroy]

  def index
    @exercises = Exercise.all
  end

  def show
  end

  def new
    @exercise = Exercise.new
  end

  def create
    @exercise = Exercise.new(exercise_params)
    workouts = params[:exercise][:workout_ids]
    workouts.reject! { |c| c.empty? }
    if @exercise.save
      workouts.each do |i|
        @exercise.workouts << Workout.find(i)
      end
      flash[:notice] = 'Exercise Saved!'
      redirect_to @exercise
    else
      flash.now[:errors] = @exercise.errors.full_messages.join(', ')
      render :new
    end
  end

  def edit
  end

  def update
    # Reset workouts array to update
    @exercise.workouts = []
    workouts = params[:exercise][:workout_ids]
    workouts.reject! { |c| c.empty? }
    @exercise.assign_attributes(exercise_params)
    if @exercise.save
      workouts.each do |i|
        @exercise.workouts << Workout.find(i)
      end
      flash[:notice] = 'Exercise Updated!'
      redirect_to @exercise
    else
      flash.now[:errors] = @exercise.errors.full_messages.join(', ')
      render :edit
    end
  end

  def destroy
    @exercise.delete
    redirect_to exercises_path
  end


  private

  def exercise_params
    params.require(:exercise).permit(:name, :detail, :duration, :started)
  end

  def get_exercise
    @exercise = Exercise.find(params[:id])
  end
end
