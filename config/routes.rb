Rails.application.routes.draw do
  resources :rides
  resources :attractions
  resources :users
  root 'welcome#home'
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'

  namespace :admin do
  resources :stats, only: [:index]
end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
