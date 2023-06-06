Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/mechanics/:id", to: "mechanics#show", as: "mechanic"
  patch "/mechanics/:id", to: "mechanics#update"

  get "/amusement_parks/:id", to: "amusement_parks#show", as: "amusement_park"
end
