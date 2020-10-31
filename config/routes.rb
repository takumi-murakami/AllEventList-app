Rails.application.routes.draw do
  devise_for :users
  root to: "events#index"
  resources :events do
    resources :comments, only: :create
  end
  resources :users
  resources :notifications, only: [:index, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
