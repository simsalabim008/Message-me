Rails.application.routes.draw do
  # resources :sessions, only: [:new, :create, :destroy]
  root 'chatroom#index'
  resources :users, except: [:new]

  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  post 'message', to: 'messages#create'

  mount ActionCable.server, at: '/cable'
end
