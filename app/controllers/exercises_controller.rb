class ExercisesController < ApplicationController
  before_action :get_exercise, only: [:show, :edit, :update, :destroy]

  def index
    @exercises = Exercise.all
  end

  def show
  end

  def new
    @exercise = Exercise.new
    @workout = Workout.find(params[:id])
  end

  def create
    # Don't ask
    workout_id = eval(params[:workout_ids].first[0])[:value]
    workout = Workout.find(workout_id)
    @exercise = Exercise.new(exercise_params)
    @exercise.assign_attributes(video_id: 'video_id')
    if @exercise.save
      workout.add_exercise(@exercise)
      flash[:notice] = 'Exercise Saved!'
      redirect_to workout
    else
      flash[:errors] = @exercise.errors.full_messages.join(', ')
      redirect_to :back
    end
  end

  def edit
  end

  def update
    @exercise.assign_attributes(exercise_params)
    @exercise.assign_attributes(video_id: 'video_id')
    if @exercise.save
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

    client = Google::APIClient.new(:key => developer_key,
                                   :authorization => nil,
                                   :application_name => 'API Project',
                                   :application_version => '1.0')

    youtube = client.discovered_api(youtube_api_service_name, youtube_api_version)
    # Call the search.list method to retrieve results matching the specified
    # query term.
    search_response = client.execute!(
      :api_method => youtube.search.list,
      :parameters => {q: keyword, maxResults: 5, part: 'id,snippet'}
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
