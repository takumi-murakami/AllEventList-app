Rails.application.routes.draw do
  devise_for :users
  root to: "events#index"
  get 'events/search'
  resources :events do
    resources :comments, only: :create
  end
  resources :users
  resources :notifications, only: [:index, :destroy]
  
  controller :report do
    get 'report' => 'report#index', as: :report
    get 'report/output', as: :output_report
  end
end
