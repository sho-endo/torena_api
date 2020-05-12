Rails.application.routes.draw do
  resources :parts, only: [:index]
  resources :users, only: [:create]
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/logged_in', to: 'sessions#logged_in'
  root to: 'static#home'
end
