Rails.application.routes.draw do
  resources :wishlists, only: [:index]
  resources :categories

  resources :books do
    resources :wishlists, only: [:index, :create, :destroy]
    resources :comments, only: [:create, :destroy]
  end
  get "home/index"
  root "books#index" 

  get "up" => "rails/health#show", as: :rails_health_check

  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  devise_for :users
  
end
