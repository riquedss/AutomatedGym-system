# frozen_string_literal: true

class User < ApplicationRecord
  has_many :gym_sheet, dependent: :destroy

  devise :database_authenticatable,
         # :confirmable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable

  include DeviseTokenAuth::Concerns::User

  enum role: { aluno: 0, instrutor: 1, admin: 2 }
  enum gender: { F: 0, M: 1 }

  REGEX_EMAIL =  /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/
  validates :name, :last_name, :email, :password, :password_confirmation, presence: true
  validates :email, format: { with: REGEX_EMAIL, message: 'E-mail invalid'  },
                    uniqueness: { case_sensitive: false }
  validates :gender, inclusion: { in: genders.keys, message: 'invalid' }
  validates :role, inclusion: { in: roles.keys, message: 'invalid' }

  def role=(value)
    super
  rescue ArgumentError
    @attributes.write_cast_value('role', value)
  end

  def gender=(value)
    super
  rescue ArgumentError
    @attributes.write_cast_value('gender', value)
  end
end
