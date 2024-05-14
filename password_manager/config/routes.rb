Rails.application.routes.draw do
  devise_for :users
  resources :passwords do
    resource :shares, only: [:new, :create, :destroy]
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get '/health_check', to: 'health_check#show'

  # Defines the root path route ("/")
  root "passwords#index"
end
