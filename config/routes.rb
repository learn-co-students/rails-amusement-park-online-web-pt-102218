Rails.application.routes.draw do
  resources :sessions
  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:create]
  resources :attractions, only: [:index, :show, :new, :create, :edit, :update]
  get "/signin", to: "sessions#new", as: "new_session"
  get "/logout", to: "sessions#destroy", as: "logout"
  post "/attractions/:id", to: "attractions#ride", as: "ride"
  
  get "/", to: "application#home", as: "root"
end
