Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'home#index'

  namespace :api do
    resources :wishlists, only: [:create, :destroy]
  end

  resources :properties, only: [:show] do
    resources :bookings, only: [:new]
  end

  resources :booking_payments, only: [:create]

  get "booking_payments/success", to: "booking_payments#success"

  resources :wishlists, only: [:index]

  resources :profiles, only: [:index]

  resources :reservations, only: [:index]
end
