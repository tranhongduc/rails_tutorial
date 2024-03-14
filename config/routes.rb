# frozen_string_literal: true

Rails.application.routes.draw do
  root "static_pages#home"
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  resources :products
  get "demo_partials/new"
  get "demo_partials/edit"
  get "static_pages/home"
  get "static_pages/help"
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  resources :users, only: %i(new create show)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
