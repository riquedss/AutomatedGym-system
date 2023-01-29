class UserSerializer < ActiveModel::Serializer
  attributes :email, :name, :last_name, :gender, :age, :height, :role, :objective
end
