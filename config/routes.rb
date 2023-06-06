Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/rides/:id", to: "rides#show"
  get "/rides/new", to: "rides#new"
  post "/rides", to: "rides#create"

  get "/amusement_parks/:id", to: "amusement_parks#show"

  get "/mechanics/:id", to: "mechanics#show"
  put "/mechanics/:id", to: "mechanics#update"
  post "/mechanics", to: "mechanics#create"
end

