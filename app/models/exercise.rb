# frozen_string_literal: true

class Exercise < ApplicationRecord
  has_many :exercise_gym_sheets, dependent: :destroy
  has_many :gym_sheets, through: :exercise_gym_sheets

  enum kind: { musculacao: 0, aerobico: 1, outros: 2 }
  enum muscle_group: { peito: 0, perna: 1, costas: 2, ombro: 3,
                       trapezio: 4, biceps: 5, gluteo: 6, triceps: 7 }

  validates :name, :kind, :muscle_group, presence: true
  validates :kind, inclusion: { in: kinds.keys, message: 'invalid' }
  validates :muscle_group, inclusion: { in: muscle_groups.keys, message: 'invalid' }

  def kind=(value)
    super
  rescue ArgumentError
    @attributes.write_cast_value('kind', value)
  end

  def muscle_group=(value)
    super
  rescue ArgumentError
    @attributes.write_cast_value('muscle_group', value)
  end
end
