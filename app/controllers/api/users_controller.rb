# frozen_string_literal: true

module Api
  class UsersController < ApplicationController
    before_action :authenticate_api_user!
    before_action :set_user, only: %i[show destroy]

    def index
      user = User.all
      render(json: user)
    end

    def show
      render(json: @user)
    end

    def create
      @user = User.new(user_params)
      if @user.save
        render(json: @user)
      else
        render(json: @user, status: :unprocessable_entity)
      end
    end

    def destroy
      @user.destroy
    end

    private

    def user_params
      params.require(:user).permit(:email, :name, :last_name, :gender, :height, :weight, :role,
                                   :date_of_birth, :objective, :password, :password_confirmation)
    end

    def set_user
      @user = User.find(params[:id])
    end
  end
end
