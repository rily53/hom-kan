Rails.application.routes.draw do
  devise_for :users
  get 'homes/index'
  root to: "homes#index"
  resources :users, only: [:edit, :update, :show]
  resources :homes, only: [:new, :create]
  # get 'devise/sessions'
  # root to: new_user_session_path
  # get 'tasks/index'
  # root to: "tasks#index"
end
