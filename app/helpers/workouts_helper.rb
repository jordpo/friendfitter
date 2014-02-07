module WorkoutsHelper

  def community_id(community, workout)
    community.id || workout.community.id
  end
end
