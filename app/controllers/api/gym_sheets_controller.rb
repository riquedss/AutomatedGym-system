# frozen_string_literal: true

module Api
  class GymSheetsController < ApplicationController
    before_action :set_gym_sheet, only: %i[show update destroy create_exercise]
    before_action :set_exercise, only: %i[create_exercise]

    def index
      @gym_sheets = GymSheet.all

      render(json: @gym_sheets)
    end

    def show
      render(json: @gym_sheet)
    end

    def create_exercise
      @exercise_gym_sheet = ExerciseGymSheet.new(exercise_gym_sheet_params)
      @exercise_gym_sheet.gym_sheet = @gym_sheet
      @exercise_gym_sheet.exercise = @exercise

      if @exercise_gym_sheet.save
        render(json: @exercise_gym_sheet, status: :created)
      else
        render(json: @exercise_gym_sheet, status: :unprocessable_entity)
      end
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

    def set_exercise
      @exercise = Exercise.find(params[:exercise_id])
    end

    def gym_sheet_params
      params.require(:gym_sheet).permit(:description, :objective)
    end

    def exercise_gym_sheet_params
      params.require(:exercise_gym_sheet).permit(:sets, :repetition)
    end
  end
end
