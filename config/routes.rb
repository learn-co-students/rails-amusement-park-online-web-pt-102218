Rails.application.routes.draw do
  get 'attractions/index', to: "attractions#index", as: "attractions"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root "welcome#home"
get '/logout' => 'sessions#destroy', as: "destroy_session"
get 'users/new', to: "users#new", as:"sign_up"
post'signin', to: "sessions#create"
get 'signin', to: "sessions#new"
resources :users

end
