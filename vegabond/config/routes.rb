Rails.application.routes.draw do
  # sessions routes by phill and adam
  get "/login", to: "sessions#new"
end
