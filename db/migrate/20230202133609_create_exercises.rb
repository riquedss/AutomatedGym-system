# frozen_string_literal: true

class CreateExercises < ActiveRecord::Migration[7.0]
  def change
    create_table(:exercises) do |t|
      t.string(:name, null: false)
      t.integer(:muscle_group, null: false)
      t.integer(:kind, null: false)

      t.timestamps
    end
  end
end
