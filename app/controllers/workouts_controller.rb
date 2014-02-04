class WorkoutsController < ApplicationController
  def index
    @workouts = Workout.order(created_at: :desc)
  end

  def show
    @exercise = Exercise.new
    @workout = Workout.find(params[:id])
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
    @workout = Workout.find(params[:id])
  end

  def update
    @workout = Workout.find(params[:id])
    @workout.assign_attributes(workout_params)
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
    @workout = Workout.find(params[:id])
    @workout.delete
    redirect_to root_path
  end


  private

  def workout_params
    params.require(:workout).permit(:name, :difficulty, :posted, :started)
  end

end
