Rails.application.routes.draw do

  root to: "users#index"

  # get '*path' => redirect('/') # to be enabled after developement
  # created by ilter and marcelo
  get   "/users", to: "users#index", as: "users"
  get   "/users/new", to: "users#new", as: "new_user"
  get   "/users/:id", to: "users#show", as: "user"
  post  "/users", to: "users#create"
  get   "/users/:id/edit", to: "users#edit", as: "edit_user"
  patch "/users/:id", to: "users#update"

   # sessions routes by phill and adam
  get   "/login", to: "sessions#new"
  get   "/logout", to: "sessions#destroy"
  post  "/sessions", to: "sessions#create"

  resources :cities do
    resources :posts
  end

#   root GET    /                                         users#index
# users GET    /users(.:format)                          users#index
# new_user GET    /users/new(.:format)                      users#new
# user GET    /users/:id(.:format)                      users#show
#      POST   /users(.:format)                          users#create
# edit_user GET    /users/:id/edit(.:format)                 users#edit
#      PATCH  /users/:id(.:format)                      users#update
# login GET    /login(.:format)                          sessions#new
# logout GET    /logout(.:format)                         sessions#destroy
# sessions POST   /sessions(.:format)                       sessions#create
# city_posts GET    /cities/:city_id/posts(.:format)          posts#index
#      POST   /cities/:city_id/posts(.:format)          posts#create
# new_city_post GET    /cities/:city_id/posts/new(.:format)      posts#new
# edit_city_post GET    /cities/:city_id/posts/:id/edit(.:format) posts#edit
# city_post GET    /cities/:city_id/posts/:id(.:format)      posts#show
#      PATCH  /cities/:city_id/posts/:id(.:format)      posts#update
#      PUT    /cities/:city_id/posts/:id(.:format)      posts#update
#      DELETE /cities/:city_id/posts/:id(.:format)      posts#destroy
# cities GET    /cities(.:format)                         cities#index
#      POST   /cities(.:format)                         cities#create
# new_city GET    /cities/new(.:format)                     cities#new
# edit_city GET    /cities/:id/edit(.:format)                cities#edit
# city GET    /cities/:id(.:format)                     cities#show
#      PATCH  /cities/:id(.:format)                     cities#update
#      PUT    /cities/:id(.:format)                     cities#update
#      DELETE /cities/:id(.:format)                     cities#destroy

end



#
#  # post routes created by adam and phill  # post routes created by ilter
# get   "/posts/new", to: "posts#new", as: "new_post"
# get   "/posts/:id", to: "posts#show", as: "post"
# post  "/posts", to: "posts#create"
# get   "/posts/:id/edit", to: "posts#edit", as: "edit_post"
# patch "/posts/:id", to: "posts#update"
#
#  # city controller created by phill
# get "/cities/:id", to: "cities#show", as: "city"
