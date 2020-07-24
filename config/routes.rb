Rails.application.routes.draw do
  resources :users, only: [:index, :show, :new, :create, :update, :edit]
  resources :rides
  resources :attractions
  root 'users#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
