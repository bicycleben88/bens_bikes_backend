Rails.application.routes.draw do
  resources :order_items
  resources :cartitems
  resources :fix_price_columns
  resources :orders
  resources :items
  resource :users, only: [:show, :create]
  post "/login", to: "users#login"
  get "/auto_login", to: "users#auto_login"
  get "/items_count", to: "items#count"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
