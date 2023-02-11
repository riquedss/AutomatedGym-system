# frozen_string_literal: true

class AddRedUserToGymSheets < ActiveRecord::Migration[7.0]
  def change
    add_reference(:gym_sheets, :user, null: false, foreign_key: true, type: :uuid)
  end
end
