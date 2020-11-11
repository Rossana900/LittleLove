Rails.application.routes.draw do
  root to: 'donors#new'
  resources :donors
  resources :donations

  get "/donations/:donor_id/new", to: "donations#new", as: :donor_donation
  post "/donations/:donor_id/", to: "donations#create", as: :donor_donations
  get "/checkout/", to: "checkouts#checkout", as: :checkout
  patch "/purchase/", to: "checkouts#purchase"
  post "/purchase/:id", to: "checkouts#donated" 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
