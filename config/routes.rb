Rails.application.routes.draw do
  root :to => 'items#index'
  resources :order_items
  resources :cartitems
  resources :fix_price_columns
  resources :orders
  resources :items
  resource :users, only: [:show, :create]
  resources :account_activations, only: [:edit]
  post "/login", to: "users#login"
  get "/auto_login", to: "users#auto_login"
  get "/items_count", to: "items#count"
end
