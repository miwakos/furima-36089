Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'

  resources :items do
    resources :orders, only: [:index, :create]
  end
  resources :users, only: :show do
    resources :addresses, only: [:edit, :create]
  end
end
