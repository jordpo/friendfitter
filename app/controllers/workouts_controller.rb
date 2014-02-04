class WorkoutsController < ApplicationController
  before_action :get_workout, only: [:show, :edit, :update, :destroy]

  def index
    @my_workouts_pending = Workout.my_workouts_pending(current_user)
    @my_workouts_completed = Workout.my_workouts_completed(current_user)
    @other_workouts = Workout.other_workouts(current_user)
  end

  def show
    @exercise = Exercise.new
    @workout_session = WorkoutSession.new
  end

  def new
    @workout = Workout.new
  end

  def create
    @workout = Workout.new(workout_params)
    current_user.workouts << @workout
    exercises = params[:workout][:exercise_ids]
    exercises.reject! { |c| c.empty? }
    exercises.each do |i|
      @workout.exercises << Exercise.find(i)
    end
    redirect_to @workout
  end

  def edit
  end

  def update
    @workout.assign_attributes(workout_params)
    # Reset exercises array in order to update
    @workout.exercises = []
    exercises = params[:workout][:exercise_ids]
    exercises.reject! { |c| c.empty? }
    if @workout.save
      exercises.each do |i|
        @workout.exercises << Exercise.find(i)
      end
      flash[:notice] = 'Workout Updated!'
      redirect_to @workout
    else
      flash.new[:errors] = @workout.errors.full_messages.join(', ')
      render :edit
    end
  end

  def destroy
    @workout.delete
    redirect_to root_path
  end


  private

  def workout_params
    params.require(:workout).permit(:name, :difficulty, :posted, :started)
  end

  def get_workout
    @workout = Workout.find(params[:id])
  end

end
