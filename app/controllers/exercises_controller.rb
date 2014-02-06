class ExercisesController < ApplicationController
  before_action :get_exercise, only: [:show, :edit, :update, :destroy]

  def index
    @exercises = Exercise.all
  end

  def show
    @exercise.video_id
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


  def youtube_search(keyword)
    developer_key = ENV["GOOGLE_KEY"]
    youtube_api_service_name = "youtube"
    youtube_api_version = "v3"

    opts = Trollop::options do
        opt :q, 'Search term', :type => String, :default => 'Crossfit'
        opt :maxResults, 'Max results', :type => :int, :default => 25
      end

    client = Google::APIClient.new(:key => developer_key,
                                   :authorization => nil,
                                   :application_name => 'API Project',
                                   :application_version => '1.0')

    youtube = client.discovered_api(youtube_api_service_name, youtube_api_version)
    # Call the search.list method to retrieve results matching the specified
    # query term.
    opts[:part], opts[:q] = 'id,snippet', keyword
    search_response = client.execute!(
      :api_method => youtube.search.list,
      :parameters => opts
    )

    # Sort through the search_response and return video_id of first video
    search_response.data.items.each do |search_result|
      if search_result.id.kind == 'youtube#video'
        return search_result.id.videoId
        break
      end
    end
  end

end
