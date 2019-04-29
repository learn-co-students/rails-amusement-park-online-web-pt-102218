Rails.application.routes.draw do
  get 'attractions/index', to: "attractions#index", as: "attractions"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root "welcome#home"
post 'users/:id', to: 'users#destroy', as: "destroy_user_session"
get 'users/new', to: "users#new", as:"sign_up"
get 'signin', to: "signin#login", as: "signin"
resources :users

end
