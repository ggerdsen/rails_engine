Rails.application.routes.draw do
  
  namespace :api do
    namespace :v1 do
      # get "/items", to: "items#index"
      resources :merchants
      resources :items
      # , only: [:index, :show, :create, :destroy, :put]
    end
  end
end
