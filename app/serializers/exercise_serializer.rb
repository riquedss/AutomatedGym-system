# frozen_string_literal: true

class ExerciseSerializer < ActiveModel::Serializer
  attributes :id, :name, :muscle_group, :kind

  has_many :exercise_gym_sheets, dependent: :destroy
  has_many :gym_sheets, through: :exercise_gym_sheets
end
