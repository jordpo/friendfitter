class AddColumnVideoIdToExercises < ActiveRecord::Migration
  def change
    add_column :exercises, :video_id, :text
  end
end
