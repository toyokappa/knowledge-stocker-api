Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: :index
      mount_devise_token_auth_for "User", at: "auth"
    end
  end
end