
Rails.application.routes.draw do
  
  namespace :api do
    namespace :v1 do
      namespace :merchants do
        get "/:id/items", to: "items#index"
      end
      resources :merchants
      
      namespace :items do
        get "/:id/merchant", to: "merchants#index"
      end
      resources :items
    end
  end
end
