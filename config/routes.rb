Rails.application.routes.draw do
  get 'homes/index'
  root to: "homes#index"
  devise_for :users
  resources :users, only: [:edit, :update, :show]
  # get 'devise/sessions'
  # root to: new_user_session_path
  # get 'tasks/index'
  # root to: "tasks#index"
end
