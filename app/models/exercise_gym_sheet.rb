# frozen_string_literal: true

class ExerciseGymSheet < ApplicationRecord
  belongs_to :exercise
  belongs_to :gym_sheet

  validates :sets, :repetition, numericality: { only_integer: true }
end
