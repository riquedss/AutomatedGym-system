# frozen_string_literal: true

class ExerciseGymSheetSerializer < ActiveModel::Serializer
  attributes :id, :sets, :repetition

  belongs_to :exercise
  belongs_to :gym_sheet
end
