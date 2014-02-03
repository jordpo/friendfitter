class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.text :name
      t.text :detail
      t.text :duration
      t.references :workout, index: true

      t.timestamps
    end
  end
end
