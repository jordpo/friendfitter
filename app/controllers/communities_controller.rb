class CommunitiesController < ApplicationController
  before_action :get_community, only: [:edit, :update, :show]

  def show
  end

  def new
    @community = Community.new
  end

  def create
    @community = Community.new(community_params)
    if @community.save
      flash[:notice] = 'Community created!'
      redirect_to @community
    else
      flash.now[:errors] = @community.errors.full_messages.join(', ')
      render :new
    end
  end

  def edit
  end

  def update
    @community.assign_attributes(community_params)
    if @community.save
      flash[:notice] = 'Community updated!'
      redirect_to @community
    else
      flash.now[:errors] = @community.errors.full_messages.join(', ')
      render :edit
    end
  end

  private
  def community_params
    params.require(:community).permit(:name, :description)
  end

  def get_community
    @community = Community.find(params[:id])
  end
end
