# frozen_string_literal: true

class CreateGymSheets < ActiveRecord::Migration[7.0]
  def change
    create_table(:gym_sheets) do |t|
      t.string(:description)
      t.string(:objective)

      t.timestamps
    end
  end
end
