Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: :index
      get  :sign_in, to: "sessions#new"
      post :sign_in, to: "sessions#create"
    end
  end
end
