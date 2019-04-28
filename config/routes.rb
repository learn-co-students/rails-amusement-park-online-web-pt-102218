Rails.application.routes.draw do
  get 'attractions/no-test-framework'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users 
  # get "/", to: "application#home", as: "root"
  root 'application#home'
  
  get '/logout' => 'sessions#destroy'
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  resources :sessions
  resources :attractions 
end
