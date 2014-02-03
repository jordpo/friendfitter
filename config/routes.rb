FriendFitter::Application.routes.draw do


  resources :exercises

  resources :workouts

  devise_for :users
  root to: 'workouts#index'
end
