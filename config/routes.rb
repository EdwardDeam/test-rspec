Rails.application.routes.draw do
  resources :products, except: [:destroy]

  root to: 'products#index'
end
