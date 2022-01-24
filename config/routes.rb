Rails.application.routes.draw do
  resources :users
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show, :create]
    end
  end

   post 'authenticate', to: 'authentication#authenticate'

end