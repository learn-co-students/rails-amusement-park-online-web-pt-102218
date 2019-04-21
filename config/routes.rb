Rails.application.routes.draw do
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  get '/signin'=> 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/logout' => 'sessions#logout'
  root 'users#welcome'
  post '/attractions/ride' => 'attractions#ride'
  resources :users, only: [:new, :show, :create, :edit, :update]
  resources :attractions
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
