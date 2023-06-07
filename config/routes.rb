Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  get "/mechanics/:id", to: "mechanics#show"
  post "/mechanics/:id/edit",to: "mechanics#create"
end
#     root to: "owners#index"

#     resources :amusement_parks do
#       resources :rides, only: [:index]
#     end
#     resources :mechanics, only: [:show]
#   end
# end
