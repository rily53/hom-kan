Rails.application.routes.draw do
  # get '/homes/room'
  devise_for :users, controllers: { invitations: 'users/invitations'}
  root to: "homes#room"
  resources :users, only: [:new, :create, :show, :edit, :update, :destroy]
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
  
