Rails.application.routes.draw do
  get '/users/new' => "users#new"
  resources :users, only: [:create, :show]
  get '/signin' => "sessions#new"
  post '/signin' => "sessions#create"
  get '/signout' => "sessions#destroy"
  get '/attractions' => "attractions#index"
  resources :attractions
  post '/rides' => "rides#create"

  root :to => 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
