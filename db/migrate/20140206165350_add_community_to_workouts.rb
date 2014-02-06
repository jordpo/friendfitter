class AddCommunityToWorkouts < ActiveRecord::Migration
  def change
    add_reference :workouts, :community, index: true
  end
end
