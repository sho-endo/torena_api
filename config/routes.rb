Rails.application.routes.draw do
  resources :parts, only: [:index, :create, :destroy], defaults: { format: :json } do
    resources :menus, only: [:create]
  end
  resources :users, only: [:create]
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/logged_in', to: 'sessions#logged_in'
  root to: 'static#home'
end
