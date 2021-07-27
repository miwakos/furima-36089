Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'

  resources :items do
    collection do
      get 'search'
    end
    resources :orders, only: [:index, :create]
  end
  resources :users, only: [:show, :edit, :update] do
    resources :addresses, only: [:create, :edit, :update]
  end
end
