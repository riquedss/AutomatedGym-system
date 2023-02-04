# frozen_string_literal: true

class CreateExerciseGymSheets < ActiveRecord::Migration[7.0]
  def change
    create_table(:exercise_gym_sheets) do |t|
      t.integer(:sets)
      t.integer(:repetition)

      t.timestamps
    end
  end
end
