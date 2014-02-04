FriendFitter::Application.routes.draw do

  resources :workouts
  resources :exercises
  resources :workout_sessions
  resources :exercise_sessions
  devise_for :users

  root to: 'workouts#index'
end
