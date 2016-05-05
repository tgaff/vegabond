Rails.application.routes.draw do
 root to: "users#index"

 get "/users", to: "users#index", as: "users"
 get "/users/new", to: "users#new", as: "new_user"
 get "/users/:id", to: "users#show", as: "user"

 post "/users", to: "users#create"
 patch "/users/:id", to: "users#update", as: "update_user"
end
