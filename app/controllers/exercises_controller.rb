class ExercisesController < ApplicationController
  def index
    @exercises = Exercise.all
  end

  def show
    @exercise = Exercise.find(params[:id])
  end

  def new
    @exercise = Exercise.new
  end

  def create
    @exercise = Exercise.new(exercise_params)
    workouts = params[:exercise][:workout_ids]
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
    @exercise = Exercise.find(params[:id])
  end

  def update
    @exercise = Exercise.find(params[:id])
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
  end


  private

  def exercise_params
    params.require(:exercise).permit(:name, :detail, :duration, :started)
  end
end
