FriendFitter::Application.routes.draw do

  resources :communities
  resources :workouts
  resources :exercises
  resources :workout_sessions
  resources :exercise_sessions
  devise_for :users, controllers: {omniauth_callbacks: 'omniauth_callbacks'}

  root to: 'workouts#index'
end
