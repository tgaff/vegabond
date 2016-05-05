Rails.application.routes.draw do
 root to: "user#index"

 get "/users", to: "users#index", as: "users"
 get "/users/:id", to: "users#show", as: "user"

 get "/users/new", to: "users#new", as: "new_user"
 post "/users", to: "users#create"
 patch "/users/:id", to: "users#update", as: "update_user"
end
