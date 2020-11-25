Rails.application.routes.draw do
  root 'application#welcome'
  resources :users, only: [:new, :create, :destroy, :show]
  resources :attractions
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy', as: 'logout'
  post '/rides', to: 'rides#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
