FriendFitter::Application.routes.draw do

  resources :workouts
  resources :exercises
  devise_for :users

  root to: 'workouts#index'
end
