FriendFitter::Application.routes.draw do

  # Join a community
  post '/members/:id' => 'members#create', as: 'member_create'
  delete '/members/:id' => 'members#destroy', as: 'member_delete'
  resources :communities
  resources :workouts, except: [:new]
  get '/workouts/new/:id' => 'workouts#new', as: 'new_workout'
  get '/workouts/copy/:id' => 'workouts#copy', as: 'copy_workout'
  resources :exercises, except: [:new]
  get '/exercises/new/:id' => 'exercises#new', as: 'new_exercise'
  resources :workout_sessions
  resources :exercise_sessions
  devise_for :users, controllers: {omniauth_callbacks: 'omniauth_callbacks'}

  root to: 'workouts#index'
end
