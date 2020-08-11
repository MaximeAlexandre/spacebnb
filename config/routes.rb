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
  
  get "/dashboards/renter", to: "dashboards#renter"
  get "/dashboards/renter/show", to: "dashboards#show_renter"
  get "/dashboards/tenant", to: "dashboards#tenant"
  get "/dashboards/tenant/show" , to: "dashboards#show_tenant"
end

