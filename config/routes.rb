Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/mechanics/:id", to: "mechanics#show"
  post "/mechanics/:id/", to: "ride_mechanics#create"
end
