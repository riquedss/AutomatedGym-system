# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    mount_devise_token_auth_for 'User', at: 'auth'
    resources :exercise_gym_sheets
    resources :exercises
    resources :gym_sheets
    resources :users, only: %i[index show destroy]

    post '/gym_sheets/:id/exercise/:exercise_id', to: 'gym_sheets#create_exercise'
  end
end
