# frozen_string_literal: true

class UserSerializer < ActiveModel::Serializer
  attributes :email, :name, :last_name, :gender, :age, :height, :role
end
