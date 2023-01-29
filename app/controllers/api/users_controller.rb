# frozen_string_literal: true

module Api
  class UsersController < ApplicationController
    before_action :set_user, only: %i[show destroy]

    def index
      user = User.all
      render(json: user)
    end

    def show
      render(json: @user)
    end

    def destroy
      @user.destroy
    end

    private

    def set_user
      @user = User.find(params[:id])
    end
  end
end
