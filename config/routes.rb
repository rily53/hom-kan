Rails.application.routes.draw do
  devise_for :users, controllers: { invitations: 'users/invitations'}
  root to: "homes#room"
  resources :users, only: [:show, :new, :create, :edit, :update, :destroy]
  resources :homes, only: [:index, :show, :new, :create] do
    collection do
      get 'room'
    end
    resources :tasks, only: [:index, :new, :create]
    resources :calendars
    resources :storehouses
  end

end
  
