Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :mechanics, only: [:show]
  resources :amusement_parks, only: [:show]

  post "/ride_mechanics", to: "ride_mechanics#create"
end
