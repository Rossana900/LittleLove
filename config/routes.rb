Rails.application.routes.draw do
  root to: 'customers#index'
  resources :customers
  resources :orders

  get "/orders/:customer_id/new", to: "orders#new", as: :customer_order
  post "/orders/:customer_id/", to: "orders#create", as: :customer_orders
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
