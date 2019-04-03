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
      resource :ranking, only: :show
      get  :authenticate, to: "sessions#show"
      post :sign_in, to: "sessions#create"
    end
  end
end
