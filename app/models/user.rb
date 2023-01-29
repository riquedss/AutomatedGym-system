# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable,
         # :confirmable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable

  include DeviseTokenAuth::Concerns::User
end
