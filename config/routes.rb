Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root "welcome#home"
get 'users/new', to: "users#new", as:"sign_up"
get 'signin', to: "signin#login", as: "signin"
resources :users

end
