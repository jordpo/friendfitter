class CreateExerciseSessions < ActiveRecord::Migration
  def change
    create_table :exercise_sessions do |t|
      t.references :exercise, index: true
      t.references :user, index: true
      t.boolean :pr
      t.text :comment
      t.text :mod
      t.boolean :accomplished
      t.text :status
    end
  end
end
