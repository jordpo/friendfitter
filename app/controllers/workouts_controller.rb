class WorkoutsController < ApplicationController
  before_action :get_workout, only: [:show, :edit, :update, :destroy]

  def index
    @my_workouts_pending = Workout.my_workouts_pending(current_user)
    @my_workouts_completed = Workout.my_workouts_completed(current_user)
    @other_workouts = Workout.other_workouts(current_user)
    @communities = Community.all
  end

  def show
    @exercise = Exercise.new
    @workout_session = WorkoutSession.new
  end

  def new
    @community = Community.find(params[:id])
    @workout = Workout.new
  end

  def create
    @workout = current_user.workouts.new(workout_params)
    if @workout.save
      flash[:notice] = 'Workout saved!'
      redirect_to @workout
    else
      flash.now[:errors] = @workout.errors.full_messages.join(', ')
      render :new
    end
  end

  def edit
    # So that the form can work
    @community = Community.new
  end

  def update
    @workout.assign_attributes(workout_params)
    exercise = Exercise.find(params[:workout][:exercise_ids].to_i)
    if @workout.save
      @workout.exercises << exercise
      # add an exercise session for each user with this workout session
      participants = @workout.workout_sessions.map do |x|
        x.user_id
      end
      participants.each do |i|
        User.find(i).exercise_sessions << ExerciseSession.new(
          exercise_id: exercise.id,
          workout_id: @workout.id,
          status: 'Pending')
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
    params.require(:workout).permit(:name, :difficulty, :posted, :started, :community_id)
  end

  def get_workout
    @workout = Workout.find(params[:id])
  end

end
