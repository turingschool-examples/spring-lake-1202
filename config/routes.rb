Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/mechanics", to: "mechanics#index"
  get "/mechanics/:id", to: "mechanics#show"
  patch "/mechanics/:id", to: "mechanics#update"

  
end
