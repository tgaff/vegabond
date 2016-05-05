Rails.application.routes.draw do
  # sessions routes by phill and adam
  get "/login", to: "sessions#new"

  post "/sessions", to: "sessions#create"
end
