Rails.application.routes.draw do
  get 'home/index'
  root to: "home#index"
  devise_for :users
  # get 'devise/sessions'
  # root to: new_user_session_path
  # get 'tasks/index'
  # root to: "tasks#index"
end
