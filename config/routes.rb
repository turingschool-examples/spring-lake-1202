Rails.application.routes.draw do

  get "/mechanics/:id", to: "mechanics#show"

end
