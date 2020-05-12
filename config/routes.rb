Rails.application.routes.draw do
  devise_for :users
  resources :products, except: [:destroy]

  root to: 'products#index'
end
