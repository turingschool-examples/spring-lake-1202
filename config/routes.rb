Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/mechanic/:id", to: "mechanics#show"

  get "/amusement_park/:id", to: "amusement_park#show"
end
