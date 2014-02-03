FriendFitter::Application.routes.draw do

  resources :workouts do
    resources :exercises
  end
  devise_for :users

  root to: 'workouts#index'
end
