# frozen_string_literal: true

class GymSheet < ApplicationRecord
  has_many :exercise_gym_sheets, dependent: :destroy
  has_many :exercise, through: :exercise_gym_sheets
end
