Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :forecast, only: [:index]
      resources :antipode, only: [:index]
      resources :backgrounds, only: [:index]
      post 'users', to: 'users#show'
    end
  end
end
