Rails.application.routes.draw do
  # sessions routes by phill and adam
  get "/login", to: "sessions#new"
  get "/logout", to: "sessions#destroy"
  post "/sessions", to: "sessions#create"
end
