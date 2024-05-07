Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :articles do
    resources :comments
  end

  # Defines the root path route ("/")
  # map requests to the welcome controller's index action
  root 'articles#index'
end
