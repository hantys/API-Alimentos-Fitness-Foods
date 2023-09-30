Rails.application.routes.draw do
  resources :products
  resources :stores
  resources :labels
  resources :categories
  resources :brands
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
