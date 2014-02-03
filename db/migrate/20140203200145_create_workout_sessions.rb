class CreateWorkoutSessions < ActiveRecord::Migration
  def change
    create_table :workout_sessions do |t|
      t.references :workout, index: true
      t.references :user, index: true
      t.boolean :pr
      t.text :comment
      t.boolean :accomplished
      t.text :status
    end
  end
end
