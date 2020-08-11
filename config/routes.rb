Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :planets do
    resources :reservations, only: [:new, :create]
    resources :reviews, only: [:new, :create]
  end
  get "/planetsuser", to: "planets#indexuser"
  resources :reservations, only: [:show, :index, :update] # index pour montrer des listes de reservations
  
  get "/dashboard/renter", to: "dashboard#renter", as: :renter
  get "/dashboard/renter/annonce_details", to: "dashboard#annonce_details"
  get "/dashboard/tenant", to: "dashboard#tenant", as: :tenant
  get "/dashboard/tenant/reservation_details" , to: "dashboard#reservation_details"
end

