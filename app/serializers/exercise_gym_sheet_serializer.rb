# frozen_string_literal: true

class ExerciseGymSheetSerializer < ActiveModel::Serializer
  attributes :id, :sets, :repetition, :exercise_id, :gym_sheet_id

  belongs_to :exercise
  belongs_to :gym_sheet
end
