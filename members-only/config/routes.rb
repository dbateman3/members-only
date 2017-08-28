Rails.application.routes.draw do
  

  get '/post', to: 'post#new'
  post '/post', to: 'post#create'
  get '/index', to: 'post#index'
  

  root 'static_pages#home'
  get '/help', to: 'static_pages#help'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  resources :users

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :posts, only: [:new, :create, :index]
  
  
end
