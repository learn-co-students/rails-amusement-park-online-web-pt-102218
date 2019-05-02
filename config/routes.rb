Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'application#home'
  resources :users
  resources :attractions
  resources :rides, only: [:create]
  # post '/attractions/ride/:id' => 'attractions#ride', as: 'ride'
  get '/signin' => 'sessions#new', as: 'signin'
  post '/auth' => 'sessions#create', as: 'auth'
  get '/logout' => 'sessions#destroy', as: 'logout'
end
