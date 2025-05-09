Rails.application.routes.draw do
  get "events/index"
  get "events/show"
  get "events/new"
  get "events/create"
  # Set the homepage to show events
  root "events#index"

  # Main resources for CRUD
  resources :participants
  resources :hosts
  resources :events
  resources :venues
  resources :genres
  resources :registrations
  resources :payments
  resources :tickets
  resources :reviews

  # System health and PWA support (optional)
  # get "up" => "rails/health#show", as: :rails_health_check
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end
