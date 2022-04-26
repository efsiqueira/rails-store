Rails.application.routes.draw do
  resources :departamentos
  root to: "products#index"
  resources :products, only: [:new, :create, :destroy, :edit, :update]
  get "products/search", to: "products#search", as: :search_product
end
