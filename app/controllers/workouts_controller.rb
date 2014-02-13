class WorkoutsController < ApplicationController
  before_action :get_workout, only: [:show, :edit, :update, :destroy, :copy]

  def index
    all = Workout.order(created_at: :desc).where(user: current_user).includes(:workout_sessions)
    @my_workouts_pending = []
    @my_workouts_completed = []
    all.each do |workout|
      workout.workout_sessions.each do |session|
        if session.accomplished?
          @my_workouts_completed << workout
        else
          @my_workouts_pending << workout
        end
      end
    end
    @other_workouts = all - @my_workouts_completed - @my_workouts_pending
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

  def copy
    new_workout = Workout.new
    new_workout.assign_attributes(
      name: @workout.name,
      difficulty: @workout.difficulty,
      community_id: @workout.community_id,
      user_id: current_user.id
      )
    if new_workout.save
      new_workout.exercises << @workout.exercises
      flash[:notice] = 'Workout copied!'
      redirect_to new_workout
    else
      flash[:errors] = new_workout.errors.full_messages.join(', ')
      redirect_to :back
    end
  end

  def edit
    # So that the form can work
    @community = Community.new
  end

  def update
    @workout.assign_attributes(workout_params)
    if params[:workout][:exercise_ids].to_i != 0
      exercise = Exercise.find(params[:workout][:exercise_ids].to_i)
      if @workout.save
        @workout.add_exercise(exercise)
        flash[:notice] = 'Workout Updated!'
        redirect_to @workout
      else
        flash.new[:errors] = @workout.errors.full_messages.join(', ')
        render :edit
      end
    else
      if @workout.save
        flash[:notice] = 'Workout Updated!'
        redirect_to @workout
      else
        flash.new[:errors] = @workout.errors.full_messages.join(', ')
        render :edit
      end
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
