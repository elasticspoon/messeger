Rails.application.routes.draw do
  resources :messages, only: :create
  get 'hangouts/index'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "hangouts#index"
end
