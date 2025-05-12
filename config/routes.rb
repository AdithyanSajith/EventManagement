Rails.application.routes.draw do
  root to: "home#index"
  get "home/index"

  devise_for :hosts
  devise_for :participants

  resources :hosts
  resources :participants
  resources :events
  resources :genres
  resources :venues
  resources :registrations
  resources :payments
  resources :tickets
end
