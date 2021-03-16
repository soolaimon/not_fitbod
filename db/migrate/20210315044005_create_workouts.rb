class CreateWorkouts < ActiveRecord::Migration[6.1]
  def change
    create_table :workouts do |t|
      t.integer :duration
      t.belongs_to :user
      t.datetime :date

      t.timestamps
    end
  end
end
