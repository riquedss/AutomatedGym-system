# frozen_string_literal: true

class AddRefExerciseToExerciseGymSheets < ActiveRecord::Migration[7.0]
  def change
    add_reference(:exercise_gym_sheets, :exercise, null: false, foreign_key: true)
  end
end
