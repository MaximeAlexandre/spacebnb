Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :planets do
    resources :reservations, only: [:new, :create]
    resources :reviews, only: [:new, :create]
  end

  # reservation can be updated by the user who own the planet users/:id/reservations/:id/new
  # or /dashboard/reservations
  # reservation: new create, edit, update, (show & index)
  resources :reservations, only: [:show]
  resources :dashboards, only: [:index]
end
