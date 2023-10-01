Rails.application.routes.draw do
  resources :platforms, only: [:index, :create, :destroy]
  resources :products

  root "homes#index"
end
