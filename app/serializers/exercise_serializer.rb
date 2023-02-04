# frozen_string_literal: true

class ExerciseSerializer < ActiveModel::Serializer
  attributes :id, :name, :muscle_group, :kind
end
