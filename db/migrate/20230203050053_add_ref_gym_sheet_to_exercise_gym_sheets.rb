# frozen_string_literal: true

class AddRefGymSheetToExerciseGymSheets < ActiveRecord::Migration[7.0]
  def change
    add_reference(:exercise_gym_sheets, :gym_sheet, null: false, foreign_key: true)
  end
end
