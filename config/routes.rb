Rails.application.routes.draw do
  resources :categories
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  #delete '/products/:id/destroy', to: 'products#destroy', as: :destroy_product
  #patch '/products/:id/update', to: 'products#update', as: :update_product
  #get '/products', to: 'products#index'
  #get '/products/:id/show', to: 'products#show', as: :product
  #get '/products/:id/edit', to: 'products#edit', as: :edit_product
  #get '/products/new', to: 'products#new', as: :new_product
  #post 'products/create', to: 'products#create', as: :create_product

  resources :products
end
