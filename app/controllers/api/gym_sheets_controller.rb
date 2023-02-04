# frozen_string_literal: true

module Api
  class GymSheetsController < ApplicationController
    before_action :set_gym_sheet, only: %i[show update destroy]

    def index
      @gym_sheets = GymSheet.all

      render(json: @gym_sheets)
    end

    def show
      render(json: @gym_sheet)
    end

    def add_exercise
    end

    def create
      @gym_sheet = GymSheet.new(gym_sheet_params)

      if @gym_sheet.save
        render(json: @gym_sheet, status: :created)
      else
        render(json: @gym_sheet.errors, status: :unprocessable_entity)
      end
    end

    def update
      if @gym_sheet.update(gym_sheet_params)
        render(json: @gym_sheet)
      else
        render(json: @gym_sheet.errors, status: :unprocessable_entity)
      end
    end

    def destroy
      @gym_sheet.destroy
    end

    private

    def set_gym_sheet
      @gym_sheet = GymSheet.find(params[:id])
    end

    def gym_sheet_params
      params.require(:gym_sheet).permit(:description, :objective)
    end
  end
end
