Rails.application.routes.draw do
  resources :users, only: [:create]
  root to: 'static#home'
end
