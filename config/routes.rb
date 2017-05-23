Rails.application.routes.draw do
  get 'home', to: 'static#home'
  get 'description/:id', to: 'products#description'
  get 'inventory/:id', to: 'products#inventory'
  resources :products
  resources :orders
  resources :invoices
end
