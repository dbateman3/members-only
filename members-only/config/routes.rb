Rails.application.routes.draw do
  

  root 'static_pages#home'

  get 'static_pages/help'

  get 'users/new'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  post '/signup', to: 'users#create'
  resources :users
end
