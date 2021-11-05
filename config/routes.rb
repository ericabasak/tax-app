Rails.application.routes.draw do
  resources :products
  get '/products/index', to: 'products#index'
  post '/products/addItem', to: 'products#addItem'
  post '/products/clearSession', to: 'products#clearSession'
  delete 'products/:id', to: 'products#destroy'
end
