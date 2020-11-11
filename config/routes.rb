Rails.application.routes.draw do
  root 'users#new'

  resources :users, only: [:new, :create, :show]
  resources :attractions, only: [:index, :show, :new, :create, :edit, :update]
  resources :rides, only: [:create]

  get '/signin', to: 'session#new', as: 'login'
  post '/signin', to: 'session#create'
  post '/logout', to: 'session#destroy', as: 'logout'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
