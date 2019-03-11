Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: :index, param: :name do
        resources :words, only: %i[index create], module: :users
      end
      post :sign_up, to: "users#create"
      get  :sign_in, to: "sessions#new"
      post :sign_in, to: "sessions#create"
    end
  end
end
