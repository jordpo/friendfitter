class MembersController < ApplicationController

  def create
    community = Community.find(params[:id])
    current_user.communities << community
    redirect_to community
  end

  def destroy
    community = Community.find(params[:id])
    current_user.communities.delete(community)
    redirect_to community
  end

end
