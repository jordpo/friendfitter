class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.text :name
      t.text :difficulty
      t.boolean :posted
      t.boolean :started
      t.references :user, index: true

      t.timestamps
    end
  end
end
