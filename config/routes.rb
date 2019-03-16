Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: :index, param: :name do
        resources :words, only: %i[index create destroy], module: :users
        resource  :achievement, only: :show, module: :users
      end
      resources :words, only: %i[show update] do
        resources :knowledges, only: %i[create update destroy], shallow: true, module: :words
      end
      post :sign_up, to: "users#create"
      get  :sign_in, to: "sessions#new"
      post :sign_in, to: "sessions#create"
    end
  end
end
