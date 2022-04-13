Rails.application.routes.draw do
  # get '/homes/room'
  root to: "homes#room"
  devise_for :users
  resources :users, only: [:edit, :update, :show]
  # get '/homes/new', to: 'homes#new'
  resources :homes, only: [:index, :new, :create, :show] do
    collection do
      get 'room'
    end
    resources :tasks, only: [:index, :new, :create]
    resources :calendars
    resources :storehouses, only: [:index, :new, :create, :show]
  end

end
  
