Rails.application.routes.draw do
  # get 'homes/index'
  root to: "homes#index"
  devise_for :users
  resources :users, only: [:edit, :update, :show]
  resources :homes, only: [:index, :new, :create, :show] do
    resources :tasks, only: [:index, :new, :create]
    collection do
      get 'room'
    end
  end
  

  # resources :tasks, only: [:index, :new, :create]
  # collection do
    # get 'room'
  # end


  # get 'devise/sessions'
  # root to: new_user_session_path
  # get 'tasks/index'
  # root to: "tasks#index"

end
  
