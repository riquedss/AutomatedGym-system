# frozen_string_literal: true

class GymSheetSerializer < ActiveModel::Serializer
  attributes :id, :description, :objective

  has_many :exercise_gym_sheets, dependent: :destroy
  has_many :exercise, through: :exercise_gym_sheets
  belongs_to :user
end
