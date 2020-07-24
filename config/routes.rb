Rails.application.routes.draw do
  resources :rides
  resources :attractions
  root 'users#new'

  resources :users, only: [:index, :show, :new, :create, :update, :edit]
  get 'signin' => 'users#signin'
  post 'signin' => 'users#login'
  get 'signup' => 'users#signup'
  post 'signup' => 'users#login'
  get 'logout' => 'users#logout'

  post 'attractions/:id' => 'attractions#add'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end