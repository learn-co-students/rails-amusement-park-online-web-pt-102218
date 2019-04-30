Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'application#home'
  resources :users
  get '/signin' => 'sessions#new', as: 'signin'
  post '/auth' => 'sessions#create', as: 'auth'
end
