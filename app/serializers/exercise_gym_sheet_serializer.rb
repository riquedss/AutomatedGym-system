# frozen_string_literal: true

class ExerciseGymSheetSerializer < ActiveModel::Serializer
  attributes :id, :sets, :repetition, :exercise_id, :gym_sheet_id
end
