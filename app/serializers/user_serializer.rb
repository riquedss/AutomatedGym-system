# frozen_string_literal: true

class UserSerializer < ActiveModel::Serializer
  attributes :email, :name, :last_name, :gender, :height, :weight, :role, :date_of_birth, :objective

  has_many :gym_sheet, dependent: :destroy
end
