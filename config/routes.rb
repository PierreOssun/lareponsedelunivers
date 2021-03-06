Rails.application.routes.draw do

  get 'sessions/new'

  root 'users#index', as: 'home'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  get '/secret', to: 'users#secret'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
