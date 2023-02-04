# frozen_string_literal: true

class GymSheetSerializer < ActiveModel::Serializer
  attributes :id, :description, :objective
end
