Rails.application.routes.draw do
  # You can have the root of your site routed with "root"
  root 'sessions#index'

  resource :session
  resources :users

  get '/admin', to: 'admin#index'
end
