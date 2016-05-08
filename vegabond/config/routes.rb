Rails.application.routes.draw do

 root to: "users#index"
 # get '*path' => redirect('/') # to be enabled after developement
 # created by ilter and marcelo
 get "/users", to: "users#index", as: "users"
 get "/users/new", to: "users#new", as: "new_user"
 get "/users/:id", to: "users#show", as: "user"
 post "/users", to: "users#create"
 get "/users/:id/edit", to: "users#edit", as: "edit_user"
 patch "/users/:id", to: "users#update"

  # sessions routes by phill and adam
  get "/login", to: "sessions#new"
  get "/logout", to: "sessions#destroy"
  post "/sessions", to: "sessions#create"

  # post routes created by adam and phill
  get "/cities/:city_id/posts/new", to: "posts#new", as: "new_post"
  get "/cities/:city_id/posts/:id", to: "posts#show", as: "post"
  post "/cities/:city_id/posts", to: "posts#create"
  # post routes created by ilter
  get "/cities/:city_id/posts/:id/edit", to: "posts#edit", as: "edit_post"
  delete "/cities/:city_id/posts/:id", to: "posts#destroy"
  patch "/cities/:city_id/posts/:id", to: "posts#update"



  # city controller created by phill
  get "/cities/:id", to: "cities#show", as: "city"

end
