Rails.application.routes.draw do
  resources :categories
  resources :comments
  resources :books do
    resources :comments, only: [:create, :destroy]
  end
  get "home/index"
  root "books#index" 

  get "up" => "rails/health#show", as: :rails_health_check

  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  devise_for :users
  
end
