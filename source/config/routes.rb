Rails.application.routes.draw do
  # You can have the root of your site routed with "root"
  root 'sessions#index'

  resources :sessions
  resources :users
end
